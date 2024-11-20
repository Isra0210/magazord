import 'package:example/src/controller/home_controller.dart';
import 'package:example/src/local_db/cache.dart';
import 'package:example/src/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/theme/theme.dart';

void main() async {
  //Initialized manually because 'GetMaterialApp' depends on this dependency injection.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  Get.put(HomeController(cache: Cache()));
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
        onInit: () {
          FlutterNativeSplash.remove();
        },
      );
    });
  }
}
