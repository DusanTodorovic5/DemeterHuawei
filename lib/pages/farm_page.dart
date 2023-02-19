import 'package:demeter_huawei/classes/layout_farm.dart';
import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../classes/farm.dart';
import '../widgets/app_bar.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({Key? key}) : super(key: key);

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final Farm farm = ModalRoute.of(context)?.settings.arguments as Farm;
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: CustomAppBar(text: farm.name),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color[700]!),
              ),
              width: double.infinity,
              height: 250.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: farm.layout.map<Widget>((FarmLayout layout) {
                  int currentIndex = farm.layout.indexOf(layout);
                  return GestureDetector(
                    onTap: () {
                      print('Clicked on ' + layout.plantInfo["name"]);
                      setState(() {
                        activeIndex = currentIndex;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: currentIndex == activeIndex ? Colors.greenAccent : Colors.redAccent,
                      ),
                      child: Center(
                        child: Text(layout.plantInfo["name"]),
                      )
                    )
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            width: double.infinity,
            height: 300.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            width: double.infinity,
            height: 300.0,
          ),
        ],
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
