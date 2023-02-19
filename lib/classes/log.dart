import 'package:demeter_huawei/classes/spray_drone_icon_icons.dart';
import 'package:flutter/material.dart';

enum LogAction {
  sprayed, // custom svg icon
  scanned, // camera_alt constant
  watered, // water_drop constant
  alert,
}

class Log {
  LogAction action;
  String text;
  String farm;
  int droneId;
  int time;

  Log({
    required this.action,
    required this.text,
    required this.farm,
    required this.droneId,
    required this.time,
  });

  Log.fromJson(Map<String, dynamic> json)
      : action = getIconFromString(json["action"]),
        text = json["text"],
        farm = json["farm"],
        droneId = json["droneId"],
        time = json["time"];

  Map<String, dynamic> toJson() => {
        "action": action.toString(),
        "text": text,
        "farm": farm,
        "droneId": droneId,
        "time": time,
      };

  DateTime dateTime() {
    return DateTime.fromMillisecondsSinceEpoch(time * 1000);
  }

  Widget icon() {
    switch (action) {
      case LogAction.sprayed:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Color.fromARGB(255, 99, 183, 134),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              SprayDroneIcon.spray_robot_icon,
              color: Colors.white,
            ),
          ),
        );
      case LogAction.scanned:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Color.fromARGB(255, 99, 183, 134),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        );
      case LogAction.watered:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Color.fromARGB(255, 99, 183, 134),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.water_drop_rounded,
              color: Colors.white,
            ),
          ),
        );
      case LogAction.alert:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Color.fromARGB(255, 99, 183, 134),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.dangerous,
              color: Colors.white,
            ),
          ),
        );
    }
  }
}

// Container(
//               color: Colors.green,
//               child: new IconButton(
//                   icon: new Icon(Icons.search,color: Colors.white,),onPressed: null),
//             ),
LogAction getIconFromString(String logType) {
  for (LogAction element in LogAction.values) {
    if (element.toString() == "LogAction.$logType") {
      return element;
    }
  }
  return LogAction.scanned;
}
