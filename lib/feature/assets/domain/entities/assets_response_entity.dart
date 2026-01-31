import 'package:equatable/equatable.dart';

import 'asset_entity.dart';

class AssetsResponseEntity extends Equatable {
  final List<AssetEntity> data;

  const AssetsResponseEntity({
    required this.data,
  });

  @override
  List<Object> get props => [
    data,
  ];
}