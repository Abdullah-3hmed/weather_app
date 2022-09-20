import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weatherprovider.dart';

import '../models/weather_model.dart';
import 'package:weather_app/modules/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            child: const Icon(
              Icons.search,
              size: 32.0,
            ),
          ),
        ],
      ),
      body: weatherData == null
          ? const Center(
              child: Text(
                'Start Search Now',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData.getThemeColor()!,
                    weatherData.getThemeColor()![300]!,
                    weatherData.getThemeColor()![100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherData.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                    ),
                  ),
                  Text(
                    'Updated : ${weatherData.date}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image(
                          image: NetworkImage(weatherData.image),
                        ),
                      ),
                      Text(
                        '${weatherData.temp.toInt()}',
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'maxTemp : ${weatherData.maxTemp.toInt()}',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'maxTemp : ${weatherData.minTemp.toInt()}',
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    weatherData.weatherState, // weatherData?.weatherState?? ''
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
