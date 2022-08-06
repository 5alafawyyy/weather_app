import 'package:flutter/material.dart';
import 'package:weather_app/modules/search_page.dart';

class WeatherModel
{
  String weatherStateName;
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;

  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data)
  {
    return WeatherModel(
      weatherStateName: data['weather_state_name'],
      date: DateTime.parse(data['created']),
      temp: data['the_temp'],
      maxTemp: data['max_temp'],
      minTemp: data['min_temp'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else
    if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else
    {
      return 'assets/images/clear.png';
    }
  }



  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else
    if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Heavy Rain') {
      return Colors.yellow;
    } else
    {
      return Colors.red;
    }
  }
}