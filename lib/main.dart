import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
void main() {
  runApp(  ChangeNotifierProvider(
    create: (BuildContext context)
    {
      return WeatherProvider();
    },
      child: WeatherApp(),
  ));
}
class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.purple : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
        //brightness: Brightness.dark

      ),
    );
  }
}