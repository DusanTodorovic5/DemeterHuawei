import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:demeter_huawei/classes/log.dart';
import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class LogsPage extends StatefulWidget {
  LogsPage({super.key});

  List<Log> farms = [];

  Future<List<Log>> loadLogs() async {
    final _json = await rootBundle.loadString('assets/logs.json');

    var parsed = json.decode(_json) as List;
    farms = [];
    for (var entry in parsed) {
      farms.add(Log.fromJson(entry));
    }

    return farms;
  }

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  late Future<List<Log>> logsFuture = widget.loadLogs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: const CustomAppBar(text: "Logs"),
      body: FutureBuilder<List<Log>>(
        future: logsFuture,
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
                    (e) => renderLog(e),
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

  Widget renderLog(Log log) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: log.icon(),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log.text,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                  Text(
                    "Time: ${log.dateTime().toString().substring(0, 19)}",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Farm: ${log.farm}",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
