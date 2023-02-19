import 'package:demeter_huawei/widgets/app_bar.dart';
import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: const CustomAppBar(text: "Weather"),
      body: Center(),
    );
  }
}
