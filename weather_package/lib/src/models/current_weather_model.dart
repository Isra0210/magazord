import 'weather_description.dart';

class CurrentWeatherModel {
  final int dt;
  final int sunrise;
  final int sunset;
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

  CurrentWeatherModel({
    required this.dt,
    required this.sunrise,
    required this.sunset,
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
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'],
      feelsLike: (json['feels_like']).toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: (json['dew_point']).toDouble(),
      uvi: (json['uvi']).toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust']?.toDouble(),
      weather: (json['weather'] as List)
          .map((item) => WeatherDescriptionModel.fromJson(item))
          .toList(),
    );
  }
}
