part of '../theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColorsAssets.light,
      ThemeTextStylesAssets.light,
    ],
  );
}
