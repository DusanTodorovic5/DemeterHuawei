import 'package:demeter_huawei/classes/drone.dart';
import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/app_bar.dart';

class DronesListPage extends StatefulWidget {
  DronesListPage({super.key});

  List<Drone> drones = [];

  Future<List<Drone>> loadLogs() async {
    final _json = await rootBundle.loadString('assets/drones.json');

    var parsed = json.decode(_json) as List;
    drones = [];
    for (var entry in parsed) {
      drones.add(Drone.fromJson(entry));
    }

    return drones;
  }

  @override
  State<DronesListPage> createState() => _DronesListPageState();
}

class _DronesListPageState extends State<DronesListPage> {
  late Future<List<Drone>> dronesFuture = widget.loadLogs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: const CustomAppBar(text: "Drones"),
      body: FutureBuilder<List<Drone>>(
        future: dronesFuture,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "No Farms Avaliable",
                  ),
                ),
              );
            }
            return ListView(
              children: snapshot.data!
                  .map(
                    (e) => renderDrone(e),
                  )
                  .toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }

  Widget renderDrone(Drone drone) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drone ID: ${drone.id}",
                      style: const TextStyle(fontSize: 22.0),
                    ),
                    Text(
                      "Last scan ${drone.lastScanAgo()}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "On farm: ${drone.farm}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => popup(drone),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Color.fromARGB(255, 99, 183, 134),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void popup(Drone drone) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            width: 400,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Center(
                  child: Text(
                    "Drone ID: ${drone.id}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 0,
                      letterSpacing: 0,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: TextEditingController(
                  text: drone.getInterval(),
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Drone scan interval",
                ),
              ),
              TextFormField(
                controller: TextEditingController(
                  text: drone.getScanTime(),
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Drone scan time",
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Color.fromARGB(255, 99, 183, 134),
                    ),
                    child: const Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
