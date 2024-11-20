import 'package:example/src/controller/home_controller.dart';
import 'package:example/src/local_db/cache.dart';
import 'package:example/src/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/theme/theme.dart';

Future<void> setupDi() async {
  await GetStorage.init();
  Get.put(HomeController(cache: Cache()));
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupDi();
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
        home: const HomeView(),
        onInit: () => FlutterNativeSplash.remove(),
      );
    });
  }
}
