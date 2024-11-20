import 'package:example/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorSelectorWidget extends GetView<HomeController> {
  const ColorSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          ...controller.colorPalette.map(
            (color) => Material(
              color: Colors.transparent,
              child: InkWell(
                overlayColor: WidgetStateProperty.all(
                  Colors.transparent,
                ),
                onTap: () {
                  controller.themeColor = color;
                },
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: color == controller.themeColor
                          ? controller.theme.colorScheme.onSurface
                          : Colors.transparent,
                    ),
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
