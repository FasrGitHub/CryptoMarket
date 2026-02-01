import 'package:flutter/material.dart';

import '../feature/assets/presentation/screens/assets_screen.dart';
import 'themes/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: createLightTheme(),
      home: AssetsScreen(),
    );
  }
}
