import '../../domain/entities/assets_response_entity.dart';
import 'asset_model.dart';

class AssetsResponseModel extends AssetsResponseEntity {
  const AssetsResponseModel({
    required super.data,
  });

  factory AssetsResponseModel.fromJson(Map<String, dynamic> json) =>
      AssetsResponseModel(
        data: List<AssetModel>.from(
          json["data"].map((x) => AssetModel.fromJson(x)),
        ),
      );
}
