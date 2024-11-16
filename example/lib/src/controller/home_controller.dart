import 'package:example/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<ThemeMode> _themeMode = Rx(ThemeMode.light);
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
  }

  ThemeData get theme => switch (themeMode) {
        ThemeMode.dark => AppTheme.darkTheme,
        _ => AppTheme.lightTheme
      };
}
