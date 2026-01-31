import '../../domain/entities/assets_response_entity.dart';
import '../../domain/repositories/assets_repository.dart';
import '../data_sources/assets_remote_data_source.dart';

class AssetsRepositoryImpl implements AssetsRepository {
  final AssetsRemoteDataSource _assetsRemoteDataSource;

  AssetsRepositoryImpl({required AssetsRemoteDataSource assetsRemoteDataSource})
    : _assetsRemoteDataSource = assetsRemoteDataSource;

  @override
  Future<AssetsResponseEntity> getAssets({
    required int limit,
    required int offset,
  }) => _assetsRemoteDataSource.getAssets(
    limit: limit,
    offset: offset,
  );
}
