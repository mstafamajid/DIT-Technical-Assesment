import 'package:dartz/dartz.dart';
import 'package:dit_battery_status/core/error/failure.dart';
import 'package:dit_battery_status/core/usecase/usecase.dart';
import 'package:dit_battery_status/feature/battery/data/models/battery_info_model.dart';


import '../repositories/battery_repository.dart';

class GetBatteryInfo extends Usecase<BatteryInfoModel, NoParam> {

  final BatteryRepository repository;

  GetBatteryInfo({required this.repository});


  @override
  Future<Either<Failure, BatteryInfoModel>> call(NoParam params) async {
     return await repository.getBatteryInfo();
  }

}


