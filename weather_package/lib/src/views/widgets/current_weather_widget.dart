import 'package:flutter/material.dart';
import 'package:weather_package/src/models/weather_model.dart';
import 'package:weather_package/src/views/widgets/text_with_highlight_widget.dart';
import 'package:weather_package/utils/extensions.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget(
      {required this.theme, required this.weather, super.key});

  final ThemeData theme;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const spacing = SizedBox(height: 8);

    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            weather.current.dt.toDate,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          spacing,
          Container(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(weather.current.temp).celsius}°C',
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 40,
                  ),
                ),
                Image.network(
                  weather.current.weather.first.icon!,
                  height: 80,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ],
            ),
          ),
          spacing,
          TextWithHighlightWidget(
            highlight: 'Umidade',
            label: '${weather.current.humidity.ceil()}%',
            theme: theme,
          ),
          spacing,
          TextWithHighlightWidget(
            highlight: 'Sensação térmica',
            label: '${weather.current.feelsLike.celsius}°C',
            theme: theme,
          ),
          spacing,
          TextWithHighlightWidget(
            highlight: 'Velocidade do vento',
            label: '~${weather.current.windSpeed}km/h',
            theme: theme,
          ),
        ],
      ),
    );
  }
}
