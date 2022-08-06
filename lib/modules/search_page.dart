import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {

  String? cityName;

  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (data) async
                {
                  cityName = data;
                  },
                onSubmitted: (data) async {
                  cityName = data;

                  WeatherServices service = WeatherServices();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter a City',
                  border: OutlineInputBorder(),
                  suffixIcon:  GestureDetector(
                    onTap: () async
                    {
                      WeatherServices service = WeatherServices();
                      WeatherModel? weather = await service.getWeather(cityName: cityName!);

                      Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                      Navigator.pop(context);
                    },
                    child: Icon(
                        Icons.search
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

