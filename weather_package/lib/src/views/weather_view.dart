import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_package/src/controller/weather_controller.dart';
import 'package:weather_package/src/views/widgets/current_weather_widget.dart';
import 'package:weather_package/src/views/widgets/daily_weather_list_widget.dart';
import 'package:weather_package/src/views/widgets/no_permission_widget.dart';
import 'package:weather_package/src/views/widgets/hourly_weather_list_widget.dart';

import 'widgets/error_widget.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.city ?? 'Clima'))),
      body: Obx(() {
        if (!controller.hasLocationPermission) {
          return NoPermissionWidget(theme: theme);
        }
        return Align(
          alignment: Alignment.topCenter,
          child: FutureBuilder(
            future: controller.getWeatherData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.error != null) {
                return TextErrorWidget(error: controller.error!, theme: theme);
              }
              return Obx(() {
                if (controller.weather == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                final weather = controller.weather!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CurrentWeatherWidget(theme: theme, weather: weather),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: HourlyWeatherListWidget(
                          hourly: weather.hourly,
                          theme: theme,
                        ),
                      ),
                      DailyWeatherListWidget(
                        theme: theme,
                        daily: weather.daily,
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        );
      }),
    );
  }
}
