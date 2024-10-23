@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channelName = FlutterMethodChannel(name: "BatteryInfo_DIT",
                                              binaryMessenger: controller.binaryMessenger)
    channelName.setMethodCallHandler({
  [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in

  guard call.method == "getBatteryInfo" else {
    result(FlutterMethodNotImplemented)
    return
  }
  self?.receiveBatteryLevel(result: result)
})

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    
    
    let batteryLevel = Int(device.batteryLevel * 100)
    
   
    let isCharging = (device.batteryState == UIDevice.BatteryState.charging )
    
    // Handle the case where battery state is unknown
    if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNKNOWN_BATTERY_STATE",
                            message: "Battery state is unknown",
                            details: nil))
    } else {
        // Create a dictionary with battery level and charging status
        let batteryInfo: [String: Any] = [
            "batteryLevel": batteryLevel,
            "isCharging": isCharging
        ]
        
        // Return the dictionary to Flutter
        result(batteryInfo)
    }
}


}