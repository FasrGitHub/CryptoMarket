import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../domain/entities/asset_entity.dart';
import '../../../domain/use_cases/get_assets_use_case.dart';

part 'assets_event.dart';

part 'assets_state.dart';

enum RequestStatus { initial, loading, success, error }

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final Talker _logger;
  final GetAssetsUseCase _getAssetsUseCase;

  static const int _limitGetAssets = 15;

  AssetsBloc({
    required Talker logger,
    required GetAssetsUseCase getAssetsUseCase,
  }) : _getAssetsUseCase = getAssetsUseCase,
       _logger = logger,
       super(AssetsState()) {
    on<GetAssets>(_getAssets, transformer: droppable());
  }

  Future<void> _getAssets(GetAssets event, Emitter<AssetsState> emit) async {
    try {
      if (state.endOfList) return;
      emit(state.copyWith(requestStatus: RequestStatus.loading));

      final response = await _getAssetsUseCase(
        limit: _limitGetAssets,
        offset: state.nextOffset,
      );

      emit(
        state.copyWith(
          endOfList: response.data.length < _limitGetAssets,
          assets: List.from(state.assets)..addAll(response.data),
          nextOffset: state.nextOffset + _limitGetAssets,
          requestStatus: RequestStatus.success,
        ),
      );
    } catch (e, stackTrace) {
      _logger.error('AssetsBloc.getAssets Exception -> $e', stackTrace);

      emit(state.copyWith(requestStatus: RequestStatus.error));
    }
  }
}
