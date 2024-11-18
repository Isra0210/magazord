import 'package:ecommerce_package/src/models/data.dart';
import 'package:ecommerce_package/src/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final products = data.map((p) => ProductModel.fromMap(p)).toList();

  int currentIndex = 0;

  void next(List<String> items) {
    currentIndex = (currentIndex + 1) % items.length;
    update();
  }

  void previous(List<String> items) {
    currentIndex = (currentIndex - 1 + items.length) % items.length;
    update();
  }
}
