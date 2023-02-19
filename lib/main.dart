import 'package:demeter_huawei/pages/drones_list.dart';
import 'package:demeter_huawei/pages/farm_page.dart';
import 'package:demeter_huawei/pages/farms_list.dart';
import 'package:demeter_huawei/pages/logs_page.dart';
import 'package:demeter_huawei/pages/preferences_page.dart';
import 'package:demeter_huawei/pages/weather_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = const {
  50: Color.fromRGBO(99, 183, 134, .0),
  100: Color.fromRGBO(99, 183, 134, .1),
  200: Color.fromRGBO(99, 183, 134, .2),
  300: Color.fromRGBO(99, 183, 134, .3),
  400: Color.fromRGBO(99, 183, 134, .4),
  500: Color.fromRGBO(99, 183, 134, .5),
  600: Color.fromRGBO(99, 183, 134, .6),
  700: Color.fromRGBO(99, 183, 134, .7),
  800: Color.fromRGBO(99, 183, 134, .8),
  900: Color.fromRGBO(99, 183, 134, .9),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          const Color.fromARGB(255, 99, 183, 134).value,
          color,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 244, 245, 245),
        appBarTheme: AppBarTheme(
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )
              .bodyText2,
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )
              .headline6,
        ),
      ),
      initialRoute: '/Farms',
      routes: {
        '/Farms': (context) => FarmsListPage(),
        '/Logs': (context) => const LogsPage(),
        '/Weather': (context) => const WeatherPage(),
        '/Preferences': (context) => const PreferencesPage(),
        '/Drones': (context) => const DronesListPage(),
        '/Farm': (context) => const FarmPage(),
      },
    );
  }
}
