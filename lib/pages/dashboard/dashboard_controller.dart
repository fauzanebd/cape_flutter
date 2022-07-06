import 'package:cape_flutter/pages/home/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Auth/controllers/load_auth_controller.dart';

class DashboardController extends GetxController {
  LoadAuthController loadAuthController = Get.find<LoadAuthController>();

  late User user;

  final String title = 'Home page';

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments;
  }

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void logout() async {
    await loadAuthController.googleSignIn.disconnect();
    await loadAuthController.firebaseAuth.signOut();
  }
}
