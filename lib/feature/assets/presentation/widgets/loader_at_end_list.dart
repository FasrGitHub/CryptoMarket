import 'package:flutter/material.dart';

import 'center_loader.dart';

class LoaderAtEndList extends StatelessWidget {
  const LoaderAtEndList({super.key});

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
      child: const CenterLoader(),
    );
  }
}
