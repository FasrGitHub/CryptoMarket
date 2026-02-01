import 'package:flutter/material.dart';

import '../../../domain/entities/asset_entity.dart';
import 'widgets/asset_logo.dart';
import 'widgets/asset_price.dart';
import 'widgets/asset_title.dart';

class AssetCard extends StatelessWidget {
  final Color logoColor;
  final AssetEntity asset;

  const AssetCard({
    super.key,
    required this.logoColor,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          AssetLogo(color: logoColor),
          AssetTitle(title: asset.symbol),
          const Spacer(),
          AssetPrice(priceUsd: asset.priceUsd),
        ],
      ),
    );
  }
}
