import 'package:ecommerce_package/ecommerce_package.dart';
import 'package:example/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_package/task_manager_package.dart';

import '../../utils/widgets/bottom_navigation_bar_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pages = [
        TaskManagerPackage(theme: controller.theme),
        const Scaffold(body: Center(child: Text('Clima'))),
        EcommercePackage(theme: controller.theme),
      ];
      return Stack(
        children: [
          pages[controller.currentPageIndex],
          // if (!kDebugMode)
          //   StreamBuilder<List<ConnectivityResult>>(
          //     stream: Connectivity().onConnectivityChanged,
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.active) {
          //         final status = snapshot.data;
          //         if (status == null ||
          //             status.contains(ConnectivityResult.none)) {
          //           return noConnectionWidget;
          //         }
          //       }
          //       return const SizedBox.shrink();
          //     },
          //   ),
          const Positioned(bottom: 0, child: BottomNavigationBarWidget())
        ],
      );
    });
  }
}
