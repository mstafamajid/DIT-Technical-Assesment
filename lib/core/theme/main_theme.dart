import 'package:flutter/material.dart';
import '../consts/colors.dart';

class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: COLOR_BLACK_1A1A19,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: COLOR_GREEN_31511E,
          fontFamily: 'monospace',
        ),
      ),
      scaffoldBackgroundColor: COLOR_BLACK_1A1A19,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(const Size(300, 60)),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
          foregroundColor: WidgetStateProperty.all(COLOR_GREEN_31511E),
          overlayColor: WidgetStateProperty.all(
            COLOR_GREEN_31511E.withOpacity(.3),
          ),
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                width: 3,
                color: COLOR_GREEN_31511E,
              ),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(COLOR_BLACK_1A1A19),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'monospace',
          color: COLOR_GREEN_31511E,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
