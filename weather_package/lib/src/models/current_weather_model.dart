import 'weather_description.dart';

class CurrentWeatherModel {
  final int dt;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final List<WeatherDescriptionModel> weather;

  CurrentWeatherModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      dt: json['dt'],
      temp: json['temp'],
      feelsLike: (json['feels_like']).toDouble(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      weather: (json['weather'] as List)
          .map((item) => WeatherDescriptionModel.fromJson(item))
          .toList(),
    );
  }
}
