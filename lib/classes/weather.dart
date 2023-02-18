import 'dart:ffi';

import 'package:demeter_huawei/classes/weather_day.dart';

class Weather {
  List<WeatherDay> days;
  UnsignedLong fromDate;
  UnsignedLong toDate;

  Weather({required this.days, required this.fromDate, required this.toDate});

  Weather.fromJson(Map<String, dynamic> json)
      : days = json["days"],
        fromDate = json["fromDate"],
        toDate = json["toDate"];

  Map<String, dynamic> toJson() => {
        "days": days,
        "fromDate": fromDate,
        "toDate": toDate,
      };
}
