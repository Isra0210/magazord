import 'package:example/src/local_db/cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme/theme.dart';

class HomeController extends GetxController {
  HomeController({required this.cache});

  final Cache cache;

  final RxInt _currentPageIndex = 0.obs;
  int get currentPageIndex => _currentPageIndex.value;
  set currentPageIndex(int value) => _currentPageIndex.value = value;

  late final Rx<ThemeMode> _themeMode = Rx(themeModeFromCache());
  ThemeMode get themeMode => _themeMode.value;
  set themeMode(ThemeMode value) => _themeMode.value = value;

  late final Rx<ThemeData> _theme = Rx(AppTheme.lightTheme.copyWith(
    primaryColor: getColorOnCache(),
  ));
  ThemeData get theme => _theme.value;
  set theme(ThemeData value) => _theme.value = value;

  late final Rx<Color> _themeColor = Rx(getColorOnCache());
  Color get themeColor => _themeColor.value;
  set themeColor(Color value) => _themeColor.value = value;

  final List<Color> colorPalette = const [
    Color(0xFF2196F3),
    Color(0xFFFF5722),
    Color(0xFF4CAF50),
    Color(0xFFFFEB3B),
    Color(0xFF9C27B0),
    Color(0xFFFF9800),
  ];

  void updateThemeMode() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
      theme = AppTheme.lightTheme.copyWith(primaryColor: themeColor);
    } else {
      theme = AppTheme.darkTheme.copyWith(primaryColor: themeColor);
      themeMode = ThemeMode.dark;
    }
    cache.saveData<String>(themeMode.name);
  }

  void updateThemeColor(Color color) {
    themeColor = color;
    theme = theme.copyWith(primaryColor: color);
    cache.saveData<int>(color.value, 'kColorTheme');
  }

  void restoreThemeColor() {
    themeColor = getColorOnCache();
  }

  ThemeMode themeModeFromCache() {
    final themeModeFromCache = cache.getData<String?>();

    if (themeModeFromCache == ThemeMode.dark.name) {
      theme = AppTheme.darkTheme.copyWith(primaryColor: getColorOnCache());
      return ThemeMode.dark;
    } else {
      theme = AppTheme.lightTheme.copyWith(primaryColor: getColorOnCache());
      return ThemeMode.light;
    }
  }

  Color getColorOnCache() {
    final color = cache.getData<int?>('kColorTheme');
    if (color != null) return Color(color);
    return AppTheme.lightTheme.primaryColor;
  }
}
