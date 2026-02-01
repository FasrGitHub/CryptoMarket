import 'package:crypto_market/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class AssetTitle extends StatelessWidget {
  final String title;

  const AssetTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: context.textStylesAssets.titleAsset),
    );
  }
}
