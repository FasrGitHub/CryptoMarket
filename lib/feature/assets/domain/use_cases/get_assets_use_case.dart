import '../repositories/assets_repository.dart';

class GetAssetsUseCase {
  final AssetsRepository _assetsRepository;

  GetAssetsUseCase({required AssetsRepository assetsRepository})
    : _assetsRepository = assetsRepository;

  Future<void> call() async => await _assetsRepository.getAssets();
}
