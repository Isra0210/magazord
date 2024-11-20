import 'weather_description.dart';

class HourlyWeatherModel {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<WeatherDescriptionModel> weather;
  final double pop;

  HourlyWeatherModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
    required this.pop,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      dt: json['dt'],
      temp: (json['temp']).toDouble(),
      feelsLike: (json['feels_like']).toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: (json['dew_point']).toDouble(),
      uvi: (json['uvi']).toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: (json['wind_speed']).toDouble(),
      windDeg: json['wind_deg'],
      windGust: json['wind_gust']?.toDouble(),
      weather: (json['weather'] as List)
          .map((item) => WeatherDescriptionModel.fromJson(item))
          .toList(),
      pop: json['pop']?.toDouble() ?? 0.0,
    );
  }
}
