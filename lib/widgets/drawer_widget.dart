import 'package:demeter_huawei/classes/drone_farm_icons.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final pages = [
    "Farms",
    "Logs",
    "Drones",
    "Weather",
    "Preferences",
  ];

  final icons = {
    "Farms": DroneFarm.farm,
    "Logs": Icons.history,
    "Drones": DroneFarm.drone,
    "Weather": Icons.cloud,
    "Preferences": Icons.settings,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: ListView(
        padding: EdgeInsets.zero,
        children: pages.map((entry) {
          return ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Color.fromARGB(255, 99, 183, 134),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icons[entry],
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              entry,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, "/$entry");
            },
          );
        }).toList(),
      ),
    );
  }
}
