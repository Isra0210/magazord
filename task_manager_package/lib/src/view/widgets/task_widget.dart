import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_package/src/controller/task_controller.dart';

class TaskWidget extends GetView<TaskController> {
  const TaskWidget({required this.index, required this.theme, super.key});

  final int index;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final task = controller.tasks[index];
    return AnimatedContainer(
      margin: const EdgeInsets.all(6),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      color: task.completed
          ? theme.colorScheme.onPrimary
          : theme.colorScheme.surface,
      child: ListTile(
        title: Text(
          task.title,
          style: theme.textTheme.bodyLarge!.copyWith(
            decoration: task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          task.description,
          style: theme.textTheme.bodySmall!,
        ),
        trailing: Checkbox(
          activeColor: theme.colorScheme.onSurface,
          value: task.completed,
          onChanged: (_) => controller.onUpdateTaskStatus(index),
        ),
        onTap: () => controller.onUpdateTaskStatus(index),
      ),
    );
  }
}
