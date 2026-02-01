part of '../theme.dart';

class ThemeColorsAssets extends ThemeExtension<ThemeColorsAssets> {
  final Color loaderButton;
  final Color backgroundScreen;

  const ThemeColorsAssets({
    required this.loaderButton,
    required this.backgroundScreen,
  });

  @override
  ThemeExtension<ThemeColorsAssets> copyWith({
    Color? loaderButton,
    Color? backgroundScreen,
  }) {
    return ThemeColorsAssets(
      loaderButton: loaderButton ?? this.loaderButton,
      backgroundScreen:
          backgroundScreen ?? this.backgroundScreen,
    );
  }

  @override
  ThemeExtension<ThemeColorsAssets> lerp(
    ThemeExtension<ThemeColorsAssets>? other,
    double t,
  ) {
    if (other is! ThemeColorsAssets) {
      return this;
    }

    return ThemeColorsAssets(
      loaderButton: Color.lerp(
        loaderButton,
        other.loaderButton,
        t,
      )!,
      backgroundScreen: Color.lerp(
        backgroundScreen,
        other.backgroundScreen,
        t,
      )!,
    );
  }

  static ThemeColorsAssets get light => ThemeColorsAssets(
    loaderButton: AppColors.orange,
    backgroundScreen: AppColors.scaffoldBackgroundColor,
  );
}
