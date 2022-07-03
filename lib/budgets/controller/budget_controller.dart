import 'package:cape_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../api/api_service.dart';
import '../../debt/model/debt.dart';
import '../../plan/model/plan.dart';

class BudgetController extends GetxController {
  final String title = "Budget page";
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  User user = Get.find<DashboardController>().user;

  var isLoading = true.obs;
  var debtList = <Debt>[].obs;
  var planList = <Plan>[].obs;

  @override
  void onInit() {
    fetchDebts(user.uid);
    fetchPlans(user.uid);
  }

  Future<void> fetchDebts(String uid) async {
    try {
      isLoading(true);
      var debt = await ApiService.fetchDebts(uid);
      if (debt != null) {
        debtList.assignAll(debt);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchPlans(String uid) async {
    try {
      isLoading(true);
      var plan = await ApiService.fetchPlans(uid);
      if (plan != null) {
        planList.assignAll(plan);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
