import '../../domain/entities/battery_status.dart';

class BatteryInfoModel extends BatteryInfo {
  const BatteryInfoModel(
      {required super.batteryLevel, required super.isCharging});

  factory BatteryInfoModel.fromMap(Map map) {
    return BatteryInfoModel(
      batteryLevel: map['batteryLevel'],
      isCharging: map['isCharging'],
    );
  }
}
