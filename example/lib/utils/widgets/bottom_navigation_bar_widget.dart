import 'package:example/src/controller/home_controller.dart';
import 'package:example/utils/theme/theme.dart';
import 'package:example/utils/widgets/switcher_theme_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'color_selector_widget.dart';

class BottomNavigationBarWidget extends GetView<HomeController> {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageData(label: 'Tarefas', icon: FontAwesomeIcons.listCheck),
      PageData(label: 'Clima', icon: FontAwesomeIcons.cloudBolt),
      PageData(label: 'Loja', icon: FontAwesomeIcons.store),
      PageData(label: 'Tema', icon: FontAwesomeIcons.palette),
    ];

    void onSelectPaletteColor() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            content: const ColorSelectorWidget(),
            actions: [
              TextButton(
                onPressed: () {
                  controller.updateThemeColor(const Color(0xFF178F4E));
                  Get.back();
                },
                child: Text(
                  'Resetar padrão',
                  style: controller.theme.textTheme.labelLarge!.copyWith(
                    color: controller.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.restoreThemeColor();
                  Get.back();
                },
                child: Text(
                  'Fechar',
                  style: controller.theme.textTheme.labelLarge!.copyWith(
                    color: controller.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.updateThemeColor(controller.themeColor);
                  Get.back();
                },
                child: Text(
                  'Salvar',
                  style: controller.theme.textTheme.labelLarge!.copyWith(
                    color: controller.theme.primaryColor,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return Obx(() {
      return AnimatedTheme(
        data: controller.theme,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(bottom: 20, top: 4, left: 16, right: 16),
          decoration: BoxDecoration(
            color: controller.theme.scaffoldBackgroundColor,
            boxShadow: [topBoxShadow(controller.themeMode)],
          ),
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...pages.map(
                      (item) {
                        final index = pages.indexOf(item);
                        return Material(
                          child: InkWell(
                            overlayColor: WidgetStateProperty.all(
                              controller.theme.colorScheme.surface,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              if (index < 3) {
                                controller.currentPageIndex = index;
                              } else {
                                onSelectPaletteColor();
                              }
                            },
                            child: Obx(() {
                              final isCurrentItem =
                                  index == controller.currentPageIndex;
                              return Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Icon(
                                      item.icon,
                                      size: 18,
                                      color: isCurrentItem
                                          ? controller.theme.primaryColor
                                          : null,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item.label,
                                      style: controller
                                          .theme.textTheme.labelMedium!
                                          .copyWith(
                                        color: isCurrentItem
                                            ? controller.theme.primaryColor
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const SwitcherThemeModeWidget(),
            ],
          ),
        ),
      );
    });
  }
}

class PageData {
  final String label;
  final IconData icon;

  PageData({required this.label, required this.icon});
}
