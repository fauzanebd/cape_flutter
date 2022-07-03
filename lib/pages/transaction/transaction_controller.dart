import 'package:cape_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../accounts/models/account.dart';
import '../../api/api_service.dart';

class TransactionController extends GetxController {
  final String title = 'Transaction page';
  final DashboardController dashboardController =
      Get.find<DashboardController>();
  User user = Get.find<DashboardController>().user;

  var isLoading = true.obs;
  var accountList = <Account>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAccounts();
  }

  Future<void> fetchAccounts() async {
    try {
      isLoading(true);
      var account = await ApiService.fetchAccounts(user.uid);
      if (account != null) {
        accountList.assignAll(account);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
