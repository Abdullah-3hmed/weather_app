import 'package:flutter/material.dart';

class WeatherModel {
  final String name;
  final String date;

// final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherState;
  final String image;

  WeatherModel({
    required this.image,
    required this.name,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherState,
  });
// factory enable us to return object
  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
        name: data['location']['name'],
        date: data['location']['localtime'],
        // DateTime.parse(data['location']['localtime'])
        temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weatherState: data['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: data['current']['condition']['icon']);
  }

  MaterialColor? getThemeColor() {
    if (weatherState == 'Clear' ||
        weatherState == 'Light Cloud' ||
        weatherState == 'Sunny') {
      return Colors.orange;
    } else if (weatherState == 'Snow' ||
        weatherState == 'Sleet' ||
        weatherState == 'Hail') {
      return Colors.blue;
    } else if (weatherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers') {
      return Colors.blue;
    }
    return null;
  }
}
