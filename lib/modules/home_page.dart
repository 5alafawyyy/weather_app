import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class HomePage extends StatefulWidget {



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void updateUi()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Weather',
        ),
        actions: [
          IconButton(
              onPressed: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return SearchPage(
                        updateUi: updateUi,
                      );
                    }),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
          )
        ],
      ),
      body: weatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'There is no weather 😔 start',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
          :
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    weatherData.getThemeColor(),
                    weatherData.getThemeColor()[200]!,
                    weatherData.getThemeColor()[50]!,

                  ],
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    '${cityTitle}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                  ),
                  Text(
                    'Updated at : ${weatherData.date.hour.toString()} : ${weatherData.date.minute.toString()}',
                    style: TextStyle(

                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                    [
                      Image.asset(
                        weatherData.getImage(),
                      width: 60.0,
                      height: 60.0,
                      ),
                      Text(
                        '${weatherData.temp.toInt()}',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          Text(
                            'Max: ${weatherData.maxTemp.toInt()}',
                          ),
                          Text(
                            'Min: ${weatherData.minTemp.toInt()}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData.weatherStateName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
