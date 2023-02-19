enum LogAction {
  sprayed,
  scanned,
  watered,
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
      : action = getWeatherFromString(json["action"]),
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
}

LogAction getWeatherFromString(String logType) {
  for (LogAction element in LogAction.values) {
    if (element.toString() == logType) {
      return element;
    }
  }
  return LogAction.scanned;
}
