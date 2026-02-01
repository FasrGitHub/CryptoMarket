import 'package:flutter/material.dart';

import '../themes/theme.dart';

extension BuildContextExt on BuildContext {
  ThemeColorsAssets get colorsAssets =>
      Theme.of(this).extension<ThemeColorsAssets>()!;

  ThemeTextStylesAssets get textStylesAssets =>
      Theme.of(this).extension<ThemeTextStylesAssets>()!;
}
