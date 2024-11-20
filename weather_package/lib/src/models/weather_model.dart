import 'current_weather_model.dart';
import 'daily_weather_model.dart';
import 'hourly_weather_model.dart';

class WeatherModel {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeatherModel current;
  final List<HourlyWeatherModel> hourly;
  final List<DailyWeatherModel> daily;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: CurrentWeatherModel.fromJson(json['current']),
      hourly: (json['hourly'] as List)
          .map((item) => HourlyWeatherModel.fromJson(item))
          .toList(),
      daily: (json['daily'] as List)
          .map((item) => DailyWeatherModel.fromJson(item))
          .toList(),
    );
  }
}

WeatherModel getWeatherFromJson(Map<String, dynamic> json) {
  return WeatherModel.fromJson(json);
}
