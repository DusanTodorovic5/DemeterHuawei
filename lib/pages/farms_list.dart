import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class FarmsListPage extends StatefulWidget {
  const FarmsListPage({super.key});

  @override
  State<FarmsListPage> createState() => _FarmsListPageState();
}

class _FarmsListPageState extends State<FarmsListPage> {
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
          title: const Text("Farms"),
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
