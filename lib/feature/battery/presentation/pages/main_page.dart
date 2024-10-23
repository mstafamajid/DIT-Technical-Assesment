import 'package:dit_battery_status/feature/battery/presentation/bloc/battery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependencies.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int? batteryLevel;
bool? isCharging;
BatteryBloc batteryBloc = di<BatteryBloc>();

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Status'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<BatteryBloc, BatteryState>(
          bloc: batteryBloc,
          listener: (context, state) {
           print("BatteryBloc state: $state");
            if (state is BatteryInfoLoaded) {
              batteryLevel = state.batteryInfo.batteryLevel;
              isCharging = state.batteryInfo.isCharging;

              setState(() {});
            }else if(state is BatteryError){
              print("Error: ${state.message}");
            }
          },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Battery Level: ${batteryLevel ?? 'Unknown click on button to get battery info'}'),
              Text(
                  'Is Charging: ${isCharging ?? 'Unknown click on button to get battery info'}'),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    batteryBloc.add(const GetBatteryInfoE());
                  },
                  child: const Text('Get Battery Info')),
              ElevatedButton(
                  onPressed: () {
                    batteryBloc.add(const GetBatteryInfoE());
                  },
                  child: const Text('Refresh button'))
            ],
          ),
        ),
      ),
    );
  }
}
