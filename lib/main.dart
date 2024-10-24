import 'package:dit_battery_status/core/consts/colors.dart';
import 'package:dit_battery_status/core/dependency_injection/dependencies.dart';
import 'package:dit_battery_status/core/theme/main_theme.dart';
import 'package:flutter/material.dart';

import 'feature/battery/presentation/pages/main_page.dart';

void main() {
  init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Battery Status',
        home: const MainPage(),
        theme: AppTheme.mainTheme);
  }
}
