import '../entities/assets_response_entity.dart';
import '../repositories/assets_repository.dart';

class GetAssetsUseCase {
  final AssetsRepository _assetsRepository;

  GetAssetsUseCase({required AssetsRepository assetsRepository})
    : _assetsRepository = assetsRepository;

  Future<AssetsResponseEntity> call({
    required int limit,
    required int offset,
  }) async =>
      await _assetsRepository.getAssets(
        limit: limit,
        offset: offset,
      );
}
