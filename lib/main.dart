import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto_market/service_locator.dart' as di;

import 'core/application.dart';
import 'core/services/error_handling_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await di.init();
  ErrorHandlingService.init();

  runZonedGuarded(() {
    runApp(const Application());
  }, ErrorHandlingService.reportError);
}
