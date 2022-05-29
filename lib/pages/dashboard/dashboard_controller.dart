import 'package:get/get.dart';

// import '../../Auth/controllers/load_auth_controller.dart';

class DashboardController extends GetxController {
  // LoadAuthController loadAuthController = Get.find<LoadAuthController>();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
