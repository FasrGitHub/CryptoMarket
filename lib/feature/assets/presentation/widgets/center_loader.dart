import 'package:crypto_market/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class CenterLoader extends StatelessWidget {
  const CenterLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: context.colorsAssets.loaderButton,
        ),
      ),
    );
  }
}
