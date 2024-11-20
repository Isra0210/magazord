import 'package:weather_package/utils/icona_path.dart';

class WeatherDescriptionModel {
  final int id;
  final String main;
  final String description;
  final String? icon;

  WeatherDescriptionModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDescriptionModel.fromJson(Map<String, dynamic> json) {
    return WeatherDescriptionModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: iconPath[json['icon']],
    );
  }
}
