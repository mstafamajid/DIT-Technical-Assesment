part of 'battery_bloc.dart';

abstract class BatteryState extends Equatable{
  const BatteryState();

  
}

class BatteryInitial extends BatteryState {
  const BatteryInitial();
  
  @override
  List<Object?> get props => [];
  
}

class BatteryLoading extends BatteryState {
  const BatteryLoading();
    @override
  List<Object?> get props => [];
}

class BatteryError extends BatteryState {
  final String message;
  
  const BatteryError(this.message);
    @override
  List<Object?> get props => [message];

}

class BatteryInfoLoaded extends BatteryState {
  
  final BatteryInfoModel batteryInfo;
  const BatteryInfoLoaded(this.batteryInfo);
    @override
  List<Object?> get props => [batteryInfo];
}
