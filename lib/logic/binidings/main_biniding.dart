import 'package:get/instance_manager.dart';
import 'package:razan_project/logic/controllers/main_Controller.dart';
import 'package:razan_project/view/screens/payment_screen.dart';

import '../controllers/cart_controller.dart';
import '../controllers/setting_controller.dart';

class MainBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());

    Get.put(PayMentScreen());
  }
}
