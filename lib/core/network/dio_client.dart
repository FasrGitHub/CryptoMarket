import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../config/env.dart';
import '../../service_locator.dart';

class DioClient {
  DioClient._internal();

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  Dio create({required Talker talker}) {
    final dio = Dio(
      /// These values should normally be moved to environment variables (env),
      /// but since this is a test assignment, I’m keeping them here.
      BaseOptions(baseUrl: 'https://rest.coincap.io/v3'),
    );

    dio.interceptors.addAll([
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printErrorData: false,
          printResponseData: false,
        ),
      ),
      RetryInterceptor(
        dio: dio,
        logPrint: talker.warning,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 2),
          Duration(seconds: 3),
          Duration(seconds: 4),
        ],
      ),
      DefaultHeadersInterceptor(),
    ]);

    return dio;
  }
}

class DefaultHeadersInterceptor extends Interceptor {
  DefaultHeadersInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = Env.apiKey;

    if (apiKey.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $apiKey';
    } else {
      getIt<Talker>().warning('ApiKey is empty! Added ApiKey!');
    }

    handler.next(options);
  }
}
