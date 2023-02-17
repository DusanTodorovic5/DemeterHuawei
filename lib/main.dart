import 'package:demeter_huawei/pages/drones_list.dart';
import 'package:demeter_huawei/pages/farms_list.dart';
import 'package:demeter_huawei/pages/logs_page.dart';
import 'package:demeter_huawei/pages/preferences_page.dart';
import 'package:demeter_huawei/pages/weather_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/Farms',
      routes: {
        '/Farms': (context) => const FarmsListPage(),
        '/Logs': (context) => const LogsPage(),
        '/Weather': (context) => const WeatherPage(),
        '/Preferences': (context) => const PreferencesPage(),
        '/Drones': (context) => const DronesListPage(),
      },
    );
  }
}
