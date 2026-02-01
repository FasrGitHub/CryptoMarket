import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/assets_bloc/assets_bloc.dart';

class TryAgainAtEndList extends StatelessWidget {
  const TryAgainAtEndList({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return Container(
      height: 72,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8 + paddingBottom,
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () => context.read<AssetsBloc>().add(GetAssets()),
          child: const Text('Try again'),
        ),
      ),
    );
  }
}
