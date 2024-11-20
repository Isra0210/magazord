import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_package/src/controller/weather_controller.dart';
import 'package:weather_package/src/views/widgets/current_weather_widget.dart';
import 'package:weather_package/src/views/widgets/daily_weather_list_widget.dart';
import 'package:weather_package/src/views/widgets/loading_widget.dart';
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
              return Obx(() {
                if (controller.weather == null) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      LoadingWidget(theme: theme),
                      if (controller.error != null)
                        TextErrorWidget(error: controller.error!, theme: theme),
                    ],
                  );
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
