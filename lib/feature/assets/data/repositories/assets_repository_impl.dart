import '../../domain/repositories/assets_repository.dart';
import '../data_sources/assets_remote_data_source.dart';

class AssetsRepositoryImpl implements AssetsRepository {
  final AssetsRemoteDataSource _assetsRemoteDataSource;

  AssetsRepositoryImpl({required AssetsRemoteDataSource assetsRemoteDataSource})
    : _assetsRemoteDataSource = assetsRemoteDataSource;

  @override
  Future<void> getAssets() {
    // TODO: implement getAssets
    throw UnimplementedError();
  }
}
