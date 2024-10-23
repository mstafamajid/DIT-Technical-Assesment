import 'package:dit_battery_status/core/error/exception.dart';
import 'package:flutter/services.dart';

import '../models/battery_info_model.dart';

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
    
      final Map batteryInfo = await platform.invokeMethod('getBatteryInfo');

      return BatteryInfoModel.fromMap(batteryInfo);
    } on PlatformException catch (e) {
    
      throw UnExpectedException(message: e.message ?? 'Something went wrong');
    }
  }
}
