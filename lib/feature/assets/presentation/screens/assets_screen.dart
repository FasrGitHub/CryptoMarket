import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/assets_bloc/assets_bloc.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetsBloc(),
      child: BlocBuilder<AssetsBloc, AssetsState>(
        builder: (context, state) {
          return Placeholder();
        },
      ),
    );
  }
}
