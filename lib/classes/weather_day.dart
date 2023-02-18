import 'package:demeter_huawei/classes/weather_type.dart';

class WeatherDay {
  int temperature;
  double humidity;
  WeatherType type;

  WeatherDay(
      {required this.temperature, required this.humidity, required this.type});

  WeatherDay.fromJson(Map<String, dynamic> json)
      : temperature = json["temperature"],
        humidity = json["humidity"],
        type = getWeatherFromString(json["type"]);

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "humidity": humidity,
        "type": type.toString(),
      };
}
