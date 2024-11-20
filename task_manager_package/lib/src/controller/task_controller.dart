import 'package:get/get.dart';
import 'package:task_manager_package/src/local_db/cache.dart';

import '../models/data.dart';
import '../models/task_model.dart';

class TaskController extends GetxController implements GetxService {
  TaskController({required this.cache});
  final Cache cache;

  final RxList<TaskModel> _tasks = <TaskModel>[].obs;
  List<TaskModel> get tasks => _tasks;
  set tasks(List<TaskModel> value) => _tasks.value = value;

  Future<void> removeTaskFromCache(TaskModel task) {
    return cache.removeData(key: '${task.id}');
  }

  void syncTasksWithCache() {
    final tasksList = data.map((e) => TaskModel.fromMap(e)).toList();
    tasks = tasksList.map((e) {
      final taskFromCache = cache.getData<String?>(key: '${e.id}');
      if (taskFromCache != null) return TaskModel.fromJson(taskFromCache);
      return e;
    }).toList();
  }

  void onUpdateTaskStatus(int index) {
    final newValue = !tasks[index].completed;
    tasks[index] = tasks[index].copyWith(completed: newValue);
    if (newValue) {
      cache.saveData(key: '${tasks[index].id}', value: tasks[index].toJson());
    } else {
      cache.removeData(key: '${tasks[index].id}');
    }
    Get.log(
      'Task [title: ${tasks[index].title}] has been updated to [status: ${tasks[index].completed}]',
    );
  }

  @override
  void onInit() {
    syncTasksWithCache();
    super.onInit();
  }
}
