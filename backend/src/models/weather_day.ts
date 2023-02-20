


export class WeatherDay {
    constructor() {

    }
    temperature:Number;
    humidity: Number;
    type: WeatherType;
}


export enum WeatherType {
    sunny = "sunny",
    raining = "raining",
    snow = "snow",
    windy = "windy",
    clouds = "clouds"
  }