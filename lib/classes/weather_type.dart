enum WeatherType {
  sunny,
  raining,
  snow,
  windy,
  clouds,
}

WeatherType getWeatherFromString(String weatherTypeAsString) {
  for (WeatherType element in WeatherType.values) {
    if (element.toString() == weatherTypeAsString) {
      return element;
    }
  }
  return WeatherType.sunny;
}
