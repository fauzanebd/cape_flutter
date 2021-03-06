import 'package:get/get.dart';

import '../../api/api_service.dart';
import '../../debt/model/debt.dart';
import '../../plan/model/plan.dart';

class BudgetController extends GetxController {
  final String title = 'Budget page';

  var isLoading = true.obs;
  var debtList = <Debt>[].obs;
  var planList = <Plan>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchDebts(String userId) async {
    try {
      isLoading(true);
      var debt = await ApiService.fetchDebts(userId);
      if (debt != null) {
        debtList.assignAll(debt);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchPlans(String userId) async {
    try {
      isLoading(true);
      var plan = await ApiService.fetchPlans(userId);
      if (plan != null) {
        planList.assignAll(plan);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
