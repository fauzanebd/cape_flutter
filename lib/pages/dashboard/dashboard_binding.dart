import 'package:get/get.dart';

import '../budget/budget_controller.dart';
import '../home/home_controller.dart';
import '../profile/profile_controller.dart';
import '../transaction/transaction_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
    Get.put<HomeController>(HomeController());
    Get.put<ProfileController>(ProfileController());
    Get.put<BudgetController>(BudgetController());
    Get.put<TransactionController>(TransactionController());
  }
}
