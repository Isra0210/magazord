library task_manager_package;

import 'package:flutter/material.dart';

import 'src/view/task_list_view.dart';

class TaskManagerPackage extends StatelessWidget {
  const TaskManagerPackage({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return TaskListView(theme: theme);
  }
}
