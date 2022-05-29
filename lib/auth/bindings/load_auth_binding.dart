import 'package:cape_flutter/Auth/controllers/load_auth_controller.dart';
import 'package:get/get.dart';

class LoadAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoadAuthController>(LoadAuthController());
  }
}
