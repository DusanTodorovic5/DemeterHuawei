class FarmLayout {
  Map<String, dynamic> plantInfo = {};
  int lastWatered = 0;

  FarmLayout.fromJson(Map<String, dynamic> json)
  {
    plantInfo = json["plant_info"];
    lastWatered = json["last_watered"];
  }
}
