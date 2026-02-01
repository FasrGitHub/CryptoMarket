import 'package:flutter/material.dart';

class AssetLogo extends StatelessWidget {
  final Color color;

  const AssetLogo({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    );
  }
}
