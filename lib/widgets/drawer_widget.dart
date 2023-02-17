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
