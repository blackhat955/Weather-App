import 'package:flutter/material.dart';

import 'weather_tile.dart';

class MainWidget extends StatelessWidget {
  final String location;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String weather;
  final String humidity;
  final String windSpeed;
  MainWidget({
    @required this.location,
    @required this.temp,
    @required this.tempMin,
    @required this.tempMax,
    @required this.weather,
    @required this.humidity,
    @required this.windSpeed,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${location.toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  '${temp.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.0,
                  ),
                ),
              ),
              Text(
                'High of${tempMax.toString()},Low of ${tempMin.toString()}',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  WeatherTile(
                      icon: Icons.thermostat_outlined,
                      tittle: "Temperature",
                      subtittle: "${temp.toString()}"),
                  WeatherTile(
                      icon: Icons.filter_drama_outlined,
                      tittle: "Weather",
                      subtittle: "${weather.toString()}"),
                  WeatherTile(
                      icon: Icons.wb_sunny,
                      tittle: "Humidity",
                      subtittle: "${humidity.toString()}%"),
                  WeatherTile(
                      icon: Icons.waves_outlined,
                      tittle: "wind speed",
                      subtittle: "${windSpeed.toString()} MPH")
                ],
              )),
        )
      ],
    );
  }
}
