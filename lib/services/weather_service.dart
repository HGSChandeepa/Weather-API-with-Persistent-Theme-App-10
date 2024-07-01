import 'dart:convert';

import 'package:weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/get_location_service.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  //get the weather from the city name
  Future<Weather> getWeather(String cityName) async {
    try {
      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }

  //get the weather from the location
  Future<Weather> getWeatherByLocation() async {
    final location = Location();
    final cityName = await location.getLocation();

    final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
