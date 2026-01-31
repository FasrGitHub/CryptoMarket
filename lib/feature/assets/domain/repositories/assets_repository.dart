import '../entities/assets_response_entity.dart';

abstract interface class AssetsRepository {
  Future<AssetsResponseEntity> getAssets({
    required int limit,
    required int offset,
  });
}
