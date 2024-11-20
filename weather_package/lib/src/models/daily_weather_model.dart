import 'temperature_model.dart';
import 'weather_description.dart';

class DailyWeatherModel {
  final int dt;
  final TemperatureModel temp;
  final int humidity;
  final double windSpeed;
  final List<WeatherDescriptionModel> weather;

  DailyWeatherModel({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      dt: json['dt'],
      temp: TemperatureModel.fromJson(json['temp']),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      weather: (json['weather'] as List)
          .map((item) => WeatherDescriptionModel.fromJson(item))
          .toList(),
    );
  }
}
