import 'package:example/src/controller/home_controller.dart';
import 'package:example/utils/theme/theme.dart';
import 'package:example/utils/widgets/switcher_theme_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends GetView<HomeController> {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pages = [
      PageData(label: 'Tarefas', icon: FontAwesomeIcons.listCheck),
      PageData(label: 'Clima', icon: FontAwesomeIcons.cloudBolt),
      PageData(label: 'Loja', icon: FontAwesomeIcons.store),
    ];
    return Obx(() {
      return AnimatedTheme(
        data: theme,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(bottom: 20, top: 4, left: 16, right: 16),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
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
                              theme.colorScheme.surface,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              controller.currentPageIndex = index;
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
                                          ? theme.primaryColor
                                          : null,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item.label,
                                      style:
                                          theme.textTheme.labelMedium!.copyWith(
                                        color: isCurrentItem
                                            ? theme.primaryColor
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
              const SizedBox(width: 30),
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
