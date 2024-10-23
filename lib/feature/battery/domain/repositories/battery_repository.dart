import 'package:dartz/dartz.dart';
import 'package:dit_battery_status/feature/battery/data/models/battery_info_model.dart';

import '../../../../core/error/failure.dart';

abstract class BatteryRepository {
  Future<Either<Failure, BatteryInfoModel>> getBatteryInfo();

}
