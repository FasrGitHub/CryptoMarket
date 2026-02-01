import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../bloc/assets_bloc/assets_bloc.dart';
import '../widgets/asset_card/asset_card.dart';
import '../widgets/center_loader.dart';
import '../widgets/loader_at_end_list.dart';
import '../widgets/try_again_at_end_list.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  late final AssetsBloc _assetsBloc;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _assetsBloc = getIt<AssetsBloc>()..add(GetAssets());
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;

    if (max - current <= max * 0.9 &&
        _assetsBloc.state.requestStatus == RequestStatus.success) {
      _assetsBloc.add(GetAssets());
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _assetsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _assetsBloc,
      child: BlocBuilder<AssetsBloc, AssetsState>(
        builder: (context, state) {
          if (state.requestStatus == RequestStatus.loading &&
              state.assets.isEmpty) {
            return CenterLoader();
          } else {
            return Scaffold(
              body: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: state.assets.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < state.assets.length) {
                    return AssetCard(asset: state.assets[index]);
                  }
                  if (state.requestStatus == RequestStatus.loading) {
                    return LoaderAtEndList();
                  }
                  if (state.requestStatus == RequestStatus.error) {
                    return TryAgainAtEndList();
                  }
                  return Container();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
