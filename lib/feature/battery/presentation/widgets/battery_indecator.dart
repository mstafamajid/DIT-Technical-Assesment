import 'package:flutter/material.dart';

class BatteryLevelIndecator extends StatelessWidget {
  const BatteryLevelIndecator(
      {super.key,
      required Animation<double> progressAnimation,
      required Animation<Color?> colorAnimation})
      : _progressAnimation = progressAnimation,
        _colorAnimation = colorAnimation;

  final Animation<double> _progressAnimation;
  final Animation<Color?> _colorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, a) => Text.rich(TextSpan(children: [
              TextSpan(text: "Battery Level: "),
              TextSpan(
                  text: _progressAnimation.value == 0
                      ? 'Unknown'
                      : "${(_progressAnimation.value * 100).toInt()}%",
                  style: TextStyle(color: _colorAnimation.value))
            ])));
  }
}
