import 'package:example/src/controller/home_controller.dart';
import 'package:example/src/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/theme/theme.dart';

void main() {
  //Initialized manually because 'GetMaterialApp' depends on this dependency injection.
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends GetView<HomeController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: controller.themeMode,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
    });
  }
}
