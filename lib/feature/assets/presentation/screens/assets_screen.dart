import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../bloc/assets_bloc/assets_bloc.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AssetsBloc>()..add(GetAssets()),
      child: BlocBuilder<AssetsBloc, AssetsState>(
        builder: (context, state) {
          return Placeholder();
        },
      ),
    );
  }
}
