import 'package:dio/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../api/assets_endpoints.dart';
import '../models/assets_response_model.dart';

class AssetsRemoteDataSource {
  final Dio _dio;
  final Talker _logger;

  AssetsRemoteDataSource({
    required Dio dio,
    required Talker logger,
  })
    : _logger = logger,
      _dio = dio;

  Future<AssetsResponseModel> getAssets({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _dio.get(
        AssetsEndpoints.assets,
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );

      return AssetsResponseModel.fromJson(response.data);
    } catch (e, stackTrace)  {
      _logger.error(
        'AssetsRemoteDataSource.getAssets Exception -> ${e.toString()}',
        stackTrace,
      );

      rethrow;
    }
  }
}
