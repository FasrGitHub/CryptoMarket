part of '../theme.dart';

class ThemeTextStylesAssets extends ThemeExtension<ThemeTextStylesAssets> {
  final TextStyle titleAsset;
  final TextStyle priceAsset;

  ThemeTextStylesAssets({
    required this.titleAsset,
    required this.priceAsset,
  });

  @override
  ThemeExtension<ThemeTextStylesAssets> copyWith({
    TextStyle? titleAsset,
    TextStyle? priceAsset,
  }) {
    return ThemeTextStylesAssets(
      titleAsset: titleAsset ?? this.titleAsset,
      priceAsset: priceAsset ?? this.priceAsset,
    );
  }

  @override
  ThemeExtension<ThemeTextStylesAssets> lerp(
    ThemeExtension<ThemeTextStylesAssets>? other,
    double t,
  ) {
    if (other is! ThemeTextStylesAssets) {
      return this;
    }

    return ThemeTextStylesAssets(
      titleAsset: TextStyle.lerp(
        titleAsset,
        other.titleAsset,
        t,
      )!,
      priceAsset: TextStyle.lerp(
        priceAsset,
        other.priceAsset,
        t,
      )!,
    );
  }

  static ThemeTextStylesAssets get light => ThemeTextStylesAssets(
    titleAsset: AppTextStyles.styleRobotoText17.copyWith(
      color: AppColors.black17171A,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.41,
      height: FigmaFormatter.lineHeight(lineHeight: 24, fontSize: 17),
    ),
    priceAsset: AppTextStyles.styleRobotoText17.copyWith(
      color: AppColors.black17171A,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.41,
      height: FigmaFormatter.lineHeight(lineHeight: 24, fontSize: 17),
    ),
  );
}
