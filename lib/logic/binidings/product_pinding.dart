import 'package:get/instance_manager.dart';
import 'package:razan_project/logic/controllers/cart_controller.dart';
import 'package:razan_project/logic/controllers/category_controller.dart';
import 'package:razan_project/logic/controllers/product_controller.dart';

import '../../view/screens/payment_screen.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
