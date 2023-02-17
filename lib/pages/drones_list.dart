import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class DronesListPage extends StatefulWidget {
  const DronesListPage({super.key});

  @override
  State<DronesListPage> createState() => _DronesListPageState();
}

class _DronesListPageState extends State<DronesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title: const Text("Drones"),
      ),
      body: Center(),
    );
  }
}
