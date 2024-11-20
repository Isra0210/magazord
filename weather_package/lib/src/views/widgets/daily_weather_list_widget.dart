import 'package:flutter/material.dart';
import 'package:weather_package/src/models/daily_weather_model.dart';
import 'package:weather_package/src/views/widgets/text_with_highlight_widget.dart';
import 'package:weather_package/utils/extensions.dart';

class DailyWeatherListWidget extends StatelessWidget {
  const DailyWeatherListWidget({
    required this.theme,
    required this.daily,
    super.key,
  });

  final ThemeData theme;
  final List<DailyWeatherModel> daily;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const spacing = SizedBox(height: 8);

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 90),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Previsão para os próximos 8 dias',
            style: theme.textTheme.bodyLarge,
          ),
          spacing,
          ...daily.map(
            (weather) => Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: theme.scaffoldBackgroundColor),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(weather.dt.day),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      weather.weather.first.icon!,
                      height: 40,
                    ),
                  ),
                  TextWithHighlightWidget(
                    highlight: 'Min',
                    label: '${weather.temp.min.celsius}°C',
                    theme: theme,
                    showDivider: true,
                  ),
                  TextWithHighlightWidget(
                    highlight: 'Max',
                    label: '${weather.temp.max.celsius}°C',
                    theme: theme,
                    showDivider: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
