package com.example.dit_battery_status;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "BatteryInfo_DIT";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getBatteryInfo")) {
                                Map<String, Object> batteryInfo = getBatteryLevel();
                                if (batteryInfo.get("batteryLevel") != null && batteryInfo.get("isCharging")!=null ) {
                                    result.success(batteryInfo); // Return the battery info to Flutter
                                } else {
                                    result.error("UnExpectedError", "Battery information not available at the time try again.", null);
                                }
                            }
                            else {
                                result.notImplemented();
                            }
                        }
                );
    }

    // Method to get battery level and charging status
    private Map<String, Object> getBatteryLevel() {
        Integer batteryLevel = null;
        Boolean isCharging = null;

        IntentFilter ifilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
        Intent batteryStatus = this.registerReceiver(null, ifilter);

        int status = batteryStatus.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
       isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING;
//
        BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);

        if (batteryManager != null) {

            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        }
//
        // Create a map to return the values
        Map<String, Object> batteryInfo = new HashMap<>();
        batteryInfo.put("batteryLevel", batteryLevel);
        batteryInfo.put("isCharging", isCharging);

        return batteryInfo;
    }
}
