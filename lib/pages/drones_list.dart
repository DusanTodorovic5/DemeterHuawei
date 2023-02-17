import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class DronesListPage extends StatefulWidget {
  const DronesListPage({super.key});

  @override
  State<DronesListPage> createState() => _DronesListPageState();
}

class _DronesListPageState extends State<DronesListPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        appBar: AppBar(
          title: const Text("Drones"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ));
  }
}
