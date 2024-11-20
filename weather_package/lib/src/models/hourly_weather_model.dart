import 'weather_description.dart';

class HourlyWeatherModel {
  final int dt;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final List<WeatherDescriptionModel> weather;

  HourlyWeatherModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      dt: json['dt'],
      temp: (json['temp']).toDouble(),
      feelsLike: (json['feels_like']).toDouble(),
      humidity: json['humidity'],
      windSpeed: (json['wind_speed']).toDouble(),
      weather: (json['weather'] as List)
          .map((item) => WeatherDescriptionModel.fromJson(item))
          .toList(),
    );
  }
}
