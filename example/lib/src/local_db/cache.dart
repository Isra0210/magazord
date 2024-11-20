import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const kThemeMode = 'themeMode';

class Cache {
  final box = GetStorage();
  Future<void> saveData<T>(T value, [String key = kThemeMode]) async {
    Get.log('Save data {$key: $value} on cache');
    box.write(key, value);
  }

  T? getData<T>([String key = kThemeMode]) {
    final data = box.read(key);
    Get.log('Get data {$key: $data} from cache');
    return data;
  }
}
