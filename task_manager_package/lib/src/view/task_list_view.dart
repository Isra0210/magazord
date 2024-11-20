import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_package/src/view/widgets/task_widget.dart';

import '../controller/task_controller.dart';

class TaskListView extends GetView<TaskController> {
  const TaskListView({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedTheme(
        data: theme,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Scaffold(
          appBar: AppBar(title: const Text('Gerenciador de Tarefas')),
          body: Obx(
            () {
              return ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(index: index, theme: theme);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
