import 'package:crypto_market/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetPrice extends StatelessWidget {
  final String priceUsd;

  const AssetPrice({super.key, required this.priceUsd});

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,##0.00", "en_US");

    return Text(
      "\$${nf.format(double.parse(priceUsd))}",
      style: context.textStylesAssets.priceAsset,
    );
  }
}
