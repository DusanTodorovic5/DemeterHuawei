import express from 'express';
import { Farm } from './models/farm';
import { FarmLayout } from './models/layout_farm';
import { Log } from './models/log';
import { Weather } from './models/weather';
import { WeatherDay, WeatherType } from './models/weather_day';



// TODO: popuni nekim podacima 

const fL = new FarmLayout()

const farma = new Farm()
farma.name = "farmica"
var datum = new Date().getTime()
console.log(datum)
farma.lastScanned = datum
farma.layout = fL;


const wD = new WeatherDay()
wD.temperature = 72
wD.humidity = 99
wD.type = WeatherType.sunny

const wD2 = new WeatherDay()
wD2.temperature = 22
wD2.humidity = 19
wD2.type = WeatherType.raining

const weather = new Weather()
datum = new Date().getTime()
weather.fromDate = datum
weather.toDate = datum

weather.days.push(wD)
weather.days.push(wD2);

// 1995-12-17T03:24:00
let sortiraniLogovi = new Log().nizSortiranih()

// console.log(sortiraniLogovi)
const data = {farma:farma, weather: weather, weatherDay:wD}



const app = express();

// TODO: napravi rute koje vracaju te neke podatke
app.get('/logs', (req, res) => res.send(new Log().nizSortiranih()));
app.get('/farms', (req, res) => res.send(new Farm().getFarms()));
app.get('/drones', (req, res) => res.send("dronovi ruta" ));


app.listen(4000, () => console.log(`Express server running on port 4000`));





