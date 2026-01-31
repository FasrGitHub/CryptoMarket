import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioClient {
  DioClient._internal();

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  Dio create({required Talker talker}) {
    final dio = Dio();

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
    ]);

    return dio;
  }
}
