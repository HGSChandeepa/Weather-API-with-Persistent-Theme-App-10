import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/widgets/display_weather.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final WeatherService _weatherService =
      WeatherService(apiKey: dotenv.env['OPEN_WEATHER_API_KEY'] ?? '');
  final TextEditingController _controller = TextEditingController();
  Weather? _weather;
  String? _error;

  void _searchWeather() async {
    final city = _controller.text.trim();
    if (city.isEmpty) {
      setState(() {
        _error = "Please enter a city name";
      });
      return;
    }

    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = "Could not fetch weather data for $city";
        _weather = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'City Name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchWeather,
                  ),
                ),
                onSubmitted: (_) => _searchWeather(),
              ),
              const SizedBox(height: 10),
              _error != null
                  ? Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    )
                  : _weather != null
                      ? WeatherDisplay(weather: _weather!)
                      : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
