import 'package:demeter_huawei/pages/drones_list.dart';
import 'package:demeter_huawei/pages/farms_list.dart';
import 'package:demeter_huawei/pages/logs_page.dart';
import 'package:demeter_huawei/pages/preferences_page.dart';
import 'package:demeter_huawei/pages/weather_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final pages = [
    "Farms",
    "Logs",
    "Weather",
    "Preferences",
    "Drones",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: pages.map((entry) {
        return ListTile(
          title: Text(entry),
          onTap: () {
            Navigator.popAndPushNamed(context, "/$entry");
          },
        );
      }).toList(),
    );
  }
}
