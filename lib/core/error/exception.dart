class UnExpectedException implements Exception {
  final String message;

  UnExpectedException({required this.message});
}

abstract class BatteryException implements Exception {
  final String message;

  BatteryException({required this.message});
}

class BatteryLevelException implements BatteryException {
  @override
  final String message;

  BatteryLevelException({required this.message});
}

class BatteryStatusException implements BatteryException {
  @override
  final String message;

  BatteryStatusException({required this.message});
}
