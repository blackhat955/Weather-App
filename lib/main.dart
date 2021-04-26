import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_report/widget/main_weather.dart';

Future<WeatherInfo> fetchWeather() async {
  final zipcode = "110020";
  final apikey = "02f1e81a7491ac464bea081598ebef98";
  final requestUrl =
      "http://api.openweathermap.org/data/2.5/weather?zip=$zipcode,in&units=imperial&appid=$apikey";
  final response = await http.get(Uri.parse(requestUrl));
  print(response.body);
  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading WeatherInfo.....");
  }
}

class WeatherInfo {
  final String location;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String weather;
  final String humidity;
  final String windSpeed;

  WeatherInfo({
    @required this.location,
    @required this.temp,
    @required this.tempMin,
    @required this.tempMax,
    @required this.weather,
    @required this.humidity,
    @required this.windSpeed,
  });
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    print("json['main']['temp_min'] : ");
    print(json['main']['temp_min']);
    return WeatherInfo(
        location: json['name'].toString(),
        temp: json['main']['temp'].toString(),
        tempMin: json['main']['temp_min'].toString(),
        tempMax: json['main']['temp_max'].toString(),
        weather: json['weather'][0]['description'].toString(),
        humidity: json['main']['humidity'].toString(),
        windSpeed: json['wind']['speed'].toString());
  }
}

void main() => runApp(
      MaterialApp(
        title: "WeatherApp",
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  Future<WeatherInfo> futureWeather;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
    print("printing futureWeather");
    print(futureWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<WeatherInfo>(
      future: futureWeather,
      builder: (context, snapshot) {
        // print("printing futureWeather in snapshot");
        // print(futureWeather);
        // print(snapshot.hasData);
        // print(snapshot.data.location);
        if (snapshot.hasData) {
          print(snapshot.data.location);
          return MainWidget(
              location: snapshot.data.location,
              temp: snapshot.data.temp,
              tempMin: snapshot.data.tempMin,
              tempMax: snapshot.data.tempMax,
              weather: snapshot.data.weather,
              humidity: snapshot.data.humidity,
              windSpeed: snapshot.data.windSpeed);
        } else if (snapshot.hasError) {
          print("Error is their");
          print(snapshot.error);
          print(snapshot.stackTrace);
          return Center(
            child: Text(
              '${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          print('nothig');
        }
        return CircularProgressIndicator();
      },
    ));
  }
}
