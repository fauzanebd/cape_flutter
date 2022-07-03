import 'package:cape_flutter/api/api_service.dart';
import 'package:cape_flutter/income/model/income.dart';
import 'package:get/get.dart';

import '../../expense/model/expense.dart';

class AccountController extends GetxController {
  AccountController(
    this.accountId,
    this.userId,
  );

  final String accountId;
  final String userId;
  var isLoading = true.obs;
  var incomeList = <Income>[].obs;
  var expenseList = <Expense>[].obs;

  @override
  void onInit() {
    fetchIncomesbyAccountId(accountId, userId);
    fetchExpensesbyAccountId(accountId, userId);
    super.onInit();
  }

  Future<void> fetchIncomesbyAccountId(String accountId, String userId) async {
    try {
      isLoading(true);
      var income = await ApiService.fetchIncomesByAccountId(userId, accountId);

      if (income != null) {
        incomeList.assignAll(income);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchExpensesbyAccountId(String accountId, String userId) async {
    try {
      isLoading(true);
      var expense =
          await ApiService.fetchExpensesByAccountId(userId, accountId);
      if (expense != null) {
        expenseList.assignAll(expense);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
