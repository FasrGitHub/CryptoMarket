import 'package:flutter/material.dart';

class AssetLogo extends StatelessWidget {
  const AssetLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    );
  }
}
