part of 'battery_bloc.dart';

abstract class BatteryEvent  {
  const BatteryEvent();


}
class GetBatteryInfoE extends BatteryEvent {
  const GetBatteryInfoE();
}
