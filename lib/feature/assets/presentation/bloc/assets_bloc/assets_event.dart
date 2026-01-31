part of 'assets_bloc.dart';

sealed class AssetsEvent extends Equatable {
  const AssetsEvent();
}

class GetAssets extends AssetsEvent {
  const GetAssets();

  @override
  List<Object> get props => [];
}
