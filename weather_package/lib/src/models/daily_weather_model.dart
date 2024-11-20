import 'feels_like.dart';
import 'temperature_model.dart';
import 'weather_description.dart';

class DailyWeatherModel {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final String summary;
  final TemperatureModel temp;
  final FeelsLikeModel feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<WeatherDescriptionModel> weather;
  final int clouds;
  final double pop;
  final double? rain;
  final double uvi;

  DailyWeatherModel({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    this.rain,
    required this.uvi,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      summary: json['summary'],
      temp: TemperatureModel.fromJson(json['temp']),
      feelsLike: FeelsLikeModel.fromJson(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: (json['dew_point']).toDouble(),
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust']?.toDouble(),
      weather: (json['weather'] as List)
          .map((item) => WeatherDescriptionModel.fromJson(item))
          .toList(),
      clouds: json['clouds'],
      pop: json['pop']?.toDouble() ?? 0.0,
      rain: json['rain']?.toDouble(),
      uvi: (json['uvi']).toDouble(),
    );
  }
}
