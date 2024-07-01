class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String description;
  final double pressure;
  final double humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  //Methode to conver the json data to Weather object
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      condition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
