import 'package:dit_battery_status/core/error/exception.dart';
import 'package:dit_battery_status/feature/battery/domain/entities/battery_status.dart';
import 'package:flutter/services.dart';

import '../models/batteryInfoModel.dart';

abstract class PlatformDataSource {
  /// Get the [BatteryInfoModel] from the platform
  /// throw Exception if something goes wrong
  Future<BatteryInfoModel> getBatteryInfo();
}

class PlatformDataSourceImpl implements PlatformDataSource {
  @override
  Future<BatteryInfoModel> getBatteryInfo() async {
    const MethodChannel platform = MethodChannel('BatteryInfo_DIT');
    try {
      print('PlatformDataSourc getBatteryInfo');
      final Map batteryInfo = await platform.invokeMethod('getBatteryInfo');

      return BatteryInfoModel.fromMap(batteryInfo);
    } on PlatformException catch (e) {
      print('PlatformDataSourc getBatteryInfo error: ${e.message}');
      throw UnExpectedException(message: e.message ?? 'Something went wrong');
    }
  }
}
