import 'package:flutter/material.dart';
import 'package:weather_package/src/models/hourly_weather_model.dart';
import 'package:weather_package/utils/extensions.dart';

class HourlyWeatherListWidget extends StatelessWidget {
  const HourlyWeatherListWidget({
    required this.theme,
    required this.hourly,
    super.key,
  });

  final ThemeData theme;
  final List<HourlyWeatherModel> hourly;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const spacing = SizedBox(height: 8);

    return Container(
      padding: const EdgeInsets.all(8),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Próximas horas',
            style: theme.textTheme.bodyLarge,
          ),
          spacing,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...hourly.map(
                  (e) => Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${(e.temp).celsius}°C',
                                style: theme.textTheme.titleMedium!.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Image.network(
                                e.weather.first.icon!,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        Text(e.dt.hour),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
