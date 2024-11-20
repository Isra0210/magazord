library weather_package;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_package/src/controller/weather_controller.dart';
import 'package:weather_package/src/service/position_service.dart';
import 'package:weather_package/src/service/weather_service.dart';
import 'package:weather_package/src/views/weather_view.dart';

class WeatherPackage extends StatelessWidget {
  const WeatherPackage({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    Get.put(
      WeatherController(WeatherService(GetConnect()), PositionService()),
    );

    return WeatherView(theme: theme);
  }
}
