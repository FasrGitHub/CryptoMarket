import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable {
  final String symbol;
  final String priceUsd;

  const AssetEntity({
    required this.symbol,
    required this.priceUsd,
  });

  @override
  List<Object> get props => [
    symbol,
    priceUsd,
  ];
}
