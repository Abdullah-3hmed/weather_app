import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'https://api.weatherapi.com/v1';
    String apiKey = '9b785b4d66f34b2b9cb95711221707';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
