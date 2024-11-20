import 'package:ecommerce_package/ecommerce_package.dart';
import 'package:example/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_package/task_manager_package.dart';
import 'package:weather_package/weather_package.dart';

import '../../utils/widgets/bottom_navigation_bar_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pages = [
        TaskManagerPackage(theme: controller.theme),
        WeatherPackage(theme: controller.theme),
        EcommercePackage(theme: controller.theme),
      ];
      return Stack(
        children: [
          pages[controller.currentPageIndex],
          const Positioned(bottom: 0, child: BottomNavigationBarWidget())
        ],
      );
    });
  }
}
