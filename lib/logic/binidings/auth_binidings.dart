import 'package:get/instance_manager.dart';
import 'package:razan_project/logic/controllers/auth_controller.dart';

class AuthBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
