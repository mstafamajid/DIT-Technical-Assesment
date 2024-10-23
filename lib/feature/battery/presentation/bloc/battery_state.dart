part of 'battery_bloc.dart';

abstract class BatteryState {
  const BatteryState();
}

class BatteryInitial extends BatteryState {
  const BatteryInitial();
}

class BatteryLoading extends BatteryState {
  const BatteryLoading();
}

class BatteryError extends BatteryState {
  final String message;
  const BatteryError(this.message);
}

class BatteryInfoLoaded extends BatteryState {
  final BatteryInfoModel batteryInfo;
  const BatteryInfoLoaded(this.batteryInfo);
}
