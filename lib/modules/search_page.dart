import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/weather_service.dart';
import 'package:weather_app/models/weatherprovider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherModel weather =
                  await WeatherService.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text(
                'Search',
              ),
              hintText: 'Enter City Name',
              contentPadding: const EdgeInsets.all(30.0),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherModel weather =
                      await WeatherService.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
