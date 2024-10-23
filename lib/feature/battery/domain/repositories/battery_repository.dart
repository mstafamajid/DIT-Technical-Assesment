import 'package:dartz/dartz.dart';
import 'package:dit_battery_status/feature/battery/data/models/batteryInfoModel.dart';
import 'package:dit_battery_status/feature/battery/domain/entities/battery_status.dart';

import '../../../../core/error/failure.dart';

abstract class BatteryRepository {
  Future<Either<Failure, BatteryInfoModel>> getBatteryInfo();

}