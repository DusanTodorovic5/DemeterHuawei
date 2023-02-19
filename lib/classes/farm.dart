import 'package:timeago/timeago.dart' as timeago;
import 'package:demeter_huawei/classes/layout_farm.dart';

class Farm {
  String name;
  int lastScanned;
  FarmLayout layout;

  Farm({required this.name, required this.lastScanned, required this.layout});

  Farm.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        lastScanned = json["last_scanned"],
        layout = FarmLayout(); //json["layout"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_scanned": lastScanned,
        "layout": layout,
      };

  String agoTime() {
    DateTime now = DateTime.now();
    DateTime scanTime = DateTime.fromMillisecondsSinceEpoch(lastScanned * 1000);
    int diff = now.difference(scanTime).inSeconds;
    return timeago.format(now.subtract(Duration(seconds: diff)));
  }
}
