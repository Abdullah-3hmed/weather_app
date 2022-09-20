import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/layout/home_page.dart';
import 'package:weather_app/models/weatherprovider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => WeatherProvider(),
        child: const WeatherApp(),
      ),
    );

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
