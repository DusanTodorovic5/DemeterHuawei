import 'package:timeago/timeago.dart' as timeago;

class Drone {
  int id;
  String farm;
  int lastScan;
  int interval;
  int scanTime;

  Drone({
    required this.id,
    required this.farm,
    required this.lastScan,
    required this.interval,
    required this.scanTime,
  });

  Drone.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        farm = json["farm"],
        lastScan = json["last_scan"],
        interval = json["interval"],
        scanTime = json["scan_time"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "farm": farm,
        "last_scan": lastScan,
        "interval": interval,
        "scan_time": scanTime,
      };

  String getInterval() {
    return "${(interval / 86400).ceil()} days";
  }

  String getScanTime() {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(this.scanTime * 1000);
    return "Next scan at ${dt.hour}:${dt.minute}";
  }

  String lastScanAgo() {
    DateTime now = DateTime.now();
    DateTime scanTime = DateTime.fromMillisecondsSinceEpoch(lastScan * 1000);
    int diff = now.difference(scanTime).inSeconds;
    return timeago.format(now.subtract(Duration(seconds: diff)));
  }
}
