import 'package:dit_battery_status/core/consts/colors.dart';
import 'package:flutter/material.dart';

class BatteryProgress extends StatelessWidget {
  const BatteryProgress({
    super.key,
    required AnimationController controller,
    required this.isCharging,
    required Animation<double> progressAnimation,
    required Animation<Color?> colorAnimation,
  })  : _controller = controller,
        _progressAnimation = progressAnimation,
        _colorAnimation = colorAnimation;

  final AnimationController _controller;
  final bool? isCharging;
  final Animation<double> _progressAnimation;
  final Animation<Color?> _colorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        
        return Container(
          decoration: BoxDecoration(
              color: COLOR_BLACK_1A1A19,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: _colorAnimation.value?.withOpacity(.7) ??
                      COLOR_BLACK_1A1A19,
                  blurRadius: 10,
                  spreadRadius: 3,
                )
              ]),
          child: Stack(
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
                    backgroundColor: _colorAnimation.value?.withOpacity(.4),
                    strokeWidth: 5,
                    value: _progressAnimation.value,
                    valueColor: _colorAnimation),
              ),
            ],
          ),
        );
      },
    );
  }
}
