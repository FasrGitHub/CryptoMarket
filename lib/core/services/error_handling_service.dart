import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../service_locator.dart';

class ErrorHandlingService {
  static Future<void> init() async {
    FlutterError.onError = (details) async {
      FlutterError.presentError(details);

      getIt<Talker>().error(details.exception, details.stack);

      Zone.current.handleUncaughtError(
        details.exception,
        details.stack ?? StackTrace.empty,
      );
    };
  }

  static void reportError(Object exception, StackTrace stackTrace) {
    getIt<Talker>().error(exception, stackTrace);
  }
}
