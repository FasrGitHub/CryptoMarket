import 'package:crypto_market/feature/assets/presentation/bloc/assets_bloc/assets_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/network/dio_client.dart';
import 'feature/assets/data/data_sources/assets_remote_data_source.dart';
import 'feature/assets/data/repositories/assets_repository_impl.dart';
import 'feature/assets/domain/repositories/assets_repository.dart';
import 'feature/assets/domain/use_cases/get_assets_use_case.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// BLoC / Cubit
  getIt.registerFactory(
        () => AssetsBloc(
          logger: getIt<Talker>(),
          getAssetsUseCase: getIt<GetAssetsUseCase>()
    ),
  );

  /// UseCases
  getIt.registerLazySingleton(() => GetAssetsUseCase(
          assetsRepository: getIt<AssetsRepository>(),
  ));

  /// Repositories
  getIt.registerLazySingleton<AssetsRepository>(
        () => AssetsRepositoryImpl(
            assetsRemoteDataSource: getIt<AssetsRemoteDataSource>()
    ),
  );
  getIt.registerLazySingleton(
        () => AssetsRemoteDataSource(
      dio: getIt(),
      logger: getIt(),
    ),
  );

  /// External
  final Talker talker = TalkerFlutter.init();
  getIt.registerLazySingleton(() => talker);

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false,
    ),
  );

  getIt.registerLazySingleton(() => DioClient().create(talker: getIt()));
}
