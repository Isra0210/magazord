import 'package:example/src/local_db/cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme/theme.dart';

class HomeController extends GetxController {
  HomeController({required this.cache});

  final Cache cache;

  late final Rx<ThemeMode> _themeMode = Rx(themeModeFromCache());
  ThemeMode get themeMode => _themeMode.value;
  set themeMode(ThemeMode value) => _themeMode.value = value;

  final RxInt _currentPageIndex = 0.obs;
  int get currentPageIndex => _currentPageIndex.value;
  set currentPageIndex(int value) => _currentPageIndex.value = value;

  void updateThemeMode() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    cache.saveData<String>(themeMode.name);
  }

  ThemeData get theme => switch (themeMode) {
        ThemeMode.dark => AppTheme.darkTheme,
        _ => AppTheme.lightTheme
      };

  ThemeMode themeModeFromCache() {
    final themeModeFromCache = cache.getData<String?>();

    final mode = switch (themeModeFromCache) {
      'dark' => ThemeMode.dark,
      _ => ThemeMode.light,
    };

    return mode;
  }
}
