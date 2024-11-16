import 'package:get/get.dart';

import '../models/data.dart';
import '../models/task_model.dart';

class TaskController extends GetxController implements GetxService {
  final List<TaskModel> tasks = data.map((e) => TaskModel.fromMap(e)).toList();

  void onUpdateTaskStatus(int index) {
    final newValue = !tasks[index].completed;
    tasks[index] = tasks[index].copyWith(completed: newValue);
    Get.log(
      'Task [title: ${tasks[index].title}] has been updated to [status: ${tasks[index].completed}]',
    );
    update();
  }
}
