import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Cache {
  final box = GetStorage();
  Future<void> saveData<T>({required String key, required T value}) async {
    Get.log('Save data {$key: $value} on cache');
    box.write(key, value);
  }

  T? getData<T>({required String key}) {
    final data = box.read(key);
    Get.log('Get data {$key: $data} from cache');
    return data;
  }

  Future<void> removeData<T>({required String key}) async {
    Get.log('Remove data {key: $key} on cache');
    box.remove(key);
  }
}
