import 'package:dit_battery_status/feature/battery/presentation/bloc/battery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependencies.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final BatteryBloc batteryBloc;
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<Color?> _colorAnimation;
  int? batteryLevel;
  bool? isCharging;
  double _previousBatteryLevel = 0;

  @override
  void initState() {
    super.initState();
    batteryBloc = di<BatteryBloc>();

    // Initialize Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Initialize the progress animation; updated dynamically
    _progressAnimation =
        Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
  }

  Color _getBatteryColor(double level) {
    if (level > 0.5) {
      return Color.lerp(Colors.yellow, Colors.green, (level - 0.5) * 2)!;
    } else {
      return Color.lerp(Colors.red, Colors.yellow, level * 2)!;
    }
  }

  @override
  void dispose() {
    batteryBloc.close();
    _controller.dispose();
    super.dispose();
  }

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
            if (state is BatteryInfoLoaded) {
              setState(() {
                batteryLevel = state.batteryInfo.batteryLevel;
                isCharging = state.batteryInfo.isCharging;

                double newBatteryLevel = (batteryLevel ?? 0) / 100;

                // Update progress animation between previous and new battery levels
                _progressAnimation = Tween<double>(
                  begin: _previousBatteryLevel,
                  end: newBatteryLevel,
                ).animate(_controller);

                // Dynamically set the color tween based on battery levels
                _colorAnimation = ColorTween(
                  begin: _getBatteryColor(_previousBatteryLevel),
                  end: _getBatteryColor(newBatteryLevel),
                ).animate(_controller);

                _previousBatteryLevel = newBatteryLevel;

                // Animate progress and color
                _controller.reset();
                _controller.forward();
              });
            } else if (state is BatteryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (batteryLevel != null)
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          if (isCharging ?? false)
                            Icon(
                              Icons.bolt,
                              size: 80,
                              color: Colors.green,
                            ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                                backgroundColor: Colors.grey[300],
                                strokeWidth: 5,
                                value: _progressAnimation.value,
                                valueColor: _colorAnimation),
                          ),
                        ],
                      );
                    },
                  ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, a) => Text(
                    'Battery Level: ${_progressAnimation.value == 0 ? 'Unknown' : (_progressAnimation.value * 100).toInt()}%',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  'Is Charging: ${isCharging == null ? 'Unknown' : (isCharging! ? 'Yes' : 'No')}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    batteryBloc.add(const GetBatteryInfoE());
                  },
                  child: const Text('Get Battery Info'),
                ),
                ElevatedButton(
                  onPressed: () {
                    batteryBloc.add(const GetBatteryInfoE());
                  },
                  child: const Text('Refresh'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
