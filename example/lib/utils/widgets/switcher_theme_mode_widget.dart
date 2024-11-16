import 'package:example/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class SwitcherThemeModeWidget extends GetView<HomeController> {
  const SwitcherThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: controller.updateThemeMode,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 68,
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            topBoxShadow(controller.themeMode),
            bottomBoxShadow(controller.themeMode),
          ],
        ),
        alignment: controller.themeMode == ThemeMode.dark
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            controller.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
            color: theme.colorScheme.surface,
            size: 16,
          ),
        ),
      ),
    );
  }
}
