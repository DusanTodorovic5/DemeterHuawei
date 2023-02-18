import 'dart:ffi';

import 'package:demeter_huawei/classes/layout_farm.dart';

class Farm {
  String name;
  UnsignedLong lastScanned;
  FarmLayout layout;

  Farm({required this.name, required this.lastScanned, required this.layout});

  Farm.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        lastScanned = json["last_scanned"],
        layout = json["layout"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_scanned": lastScanned,
        "layout": layout,
      };
}
