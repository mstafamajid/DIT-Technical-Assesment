import 'package:equatable/equatable.dart';

class BatteryInfo extends Equatable {
  final int? batteryLevel;
  final bool? isCharging;
  const BatteryInfo({required this.batteryLevel, required this.isCharging});

  @override
  List<Object?> get props => [batteryLevel, isCharging];
}
