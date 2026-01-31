part of 'assets_bloc.dart';

class AssetsState extends Equatable {
  final List<AssetEntity> assets;
  final int nextOffset;
  final bool endOfList;
  final RequestStatus requestStatus;

  const AssetsState({
   this.assets = const [],
   this.nextOffset = 0,
   this.endOfList = false,
   this.requestStatus = RequestStatus.initial,
  });

  @override
  List<Object> get props => [
    assets,
    nextOffset,
    endOfList,
    requestStatus,
  ];

  AssetsState copyWith({
    List<AssetEntity>? assets,
    int? nextOffset,
    bool? endOfList,
    RequestStatus? requestStatus,
  }) {
    return AssetsState(
      assets: assets ?? this.assets,
      nextOffset: nextOffset ?? this.nextOffset,
      endOfList: endOfList ?? this.endOfList,
      requestStatus: requestStatus ?? this.requestStatus,
    );
  }
}
