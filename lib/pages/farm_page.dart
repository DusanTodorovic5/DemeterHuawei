import 'package:demeter_huawei/classes/layout_farm.dart';
import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../main.dart';
import '../classes/farm.dart';
import '../widgets/app_bar.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({Key? key}) : super(key: key);

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class ImageLayout {
  String src;
  String name;
  Color color;
  bool clicked = false;

  ImageLayout({required this.src, required this.name, required this.color});
}

class _FarmPageState extends State<FarmPage> {
  String selected = "";
  List<ImageLayout> images = [
    ImageLayout(
      src: "1.png",
      name: "Tomato",
      color: const Color.fromARGB(255, 83, 255, 115),
    ),
    ImageLayout(
      src: "2.png",
      name: "Onions",
      color: const Color.fromARGB(255, 236, 255, 68),
    ),
    ImageLayout(
      src: "3.png",
      name: "Tomato",
      color: const Color.fromARGB(255, 83, 255, 115),
    ),
    ImageLayout(
      src: "2.png",
      name: "Onions",
      color: const Color.fromARGB(255, 236, 255, 68),
    ),
    ImageLayout(
      src: "3.png",
      name: "Tomato",
      color: const Color.fromARGB(255, 83, 255, 115),
    ),
    ImageLayout(
      src: "2.png",
      name: "Onions",
      color: const Color.fromARGB(255, 236, 255, 68),
    ),
  ];
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final Farm farm = ModalRoute.of(context)?.settings.arguments as Farm;
    return Scaffold(
      appBar: CustomAppBar(text: farm.name),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Farm Layout",
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: images.map<Widget>((ImageLayout img) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selected = img.name;
                        for (ImageLayout el in images) {
                          if (el.name == img.name) {
                            el.clicked = true;
                          } else {
                            el.clicked = false;
                          }
                        }
                      });
                    },
                    child: !img.clicked
                        ? SimpleShadow(
                            color: Colors.white,
                            opacity: 0.2,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                img.color,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "assets/${img.src}",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          )
                        : SimpleShadow(
                            opacity: 1,
                            offset: const Offset(0, 0),
                            sigma: 2,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                img.color,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "assets/${img.src}",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                  );
                }).toList(),
              ),
            ),
          ),
          (selected == ""
              ? Container()
              : Column(
                  children: [
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Selected crop: $selected",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              selected == "Tomato"
                                  ? "Crops are healthy"
                                  : "Some crops might be vulnerable",
                              style: TextStyle(
                                fontSize: 20,
                                color: selected == "Tomato"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                            subtitle: Text(
                              selected == "Tomato"
                                  ? "Automatic spraying is on"
                                  : "Automatic spraying is off",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
        ],
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
