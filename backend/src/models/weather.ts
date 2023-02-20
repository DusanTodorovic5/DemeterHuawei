import { WeatherDay } from "./weather_day";


export class Weather {
    constructor() {

    }
    fromDate: Number;
    toDate: Number
    days: Array<WeatherDay> = []
}