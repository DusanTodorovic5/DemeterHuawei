import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class FarmsListPage extends StatefulWidget {
  const FarmsListPage({super.key});

  @override
  State<FarmsListPage> createState() => _FarmsListPageState();
}

class _FarmsListPageState extends State<FarmsListPage> {
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
