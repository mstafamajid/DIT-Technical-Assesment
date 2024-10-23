import 'package:dartz/dartz.dart';

import 'package:dit_battery_status/core/error/failure.dart';
import 'package:dit_battery_status/feature/battery/data/datasources/platform_data_source.dart';
import 'package:dit_battery_status/feature/battery/data/models/batteryInfoModel.dart';

import 'package:dit_battery_status/feature/battery/domain/entities/battery_status.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repositories/battery_repository.dart';

class BatteryRepositoryImp extends BatteryRepository {
  final PlatformDataSource platformDataSource;

  BatteryRepositoryImp({required this.platformDataSource});
  @override
  Future<Either<Failure, BatteryInfoModel>> getBatteryInfo() async {
    try {
      print('BatteryRepositoryImp: getBatteryInfo');
      final result = await platformDataSource.getBatteryInfo();
      return right(result);
    } on UnExpectedException catch (e) {
      return left(UnExpectedFailure(message: e.message));
    }
  }
}
