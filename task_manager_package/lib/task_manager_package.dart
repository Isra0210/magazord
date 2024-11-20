library task_manager_package;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_package/src/local_db/cache.dart';

import 'src/controller/task_controller.dart';
import 'src/view/task_list_view.dart';

class TaskManagerPackage extends StatelessWidget {
  const TaskManagerPackage({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController(cache: Cache()));
    return TaskListView(theme: theme);
  }
}
