import '../../domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.symbol,
    required super.priceUsd,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      AssetModel(
        symbol: json["symbol"],
        priceUsd: json["priceUsd"],
      );
}
