import 'package:cape_flutter/expense/model/expense.dart';
import 'package:cape_flutter/expense/model/expense_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_service.dart';
import '../../common/views/custom_load_dialog.dart';

class ExpenseCategoriesController extends GetxController {
  ExpenseCategoriesController({
    required this.userId,
    required this.accountId,
  });

  final String userId;
  final String accountId;

  var isLoading = true.obs;
  var expenseCategoriesList = <ExpenseCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    CustomLoadDialog.showDialog(barrierColor: Colors.black.withOpacity(0.5));
    fetchExpenseCategories();
    CustomLoadDialog.cancelDialog();
  }

  Future<void> fetchExpenseCategories() async {
    try {
      isLoading(true);
      var expenseCategories = await ApiService.fetchExpenseCategories();
      if (expenseCategories != null) {
        expenseCategoriesList.assignAll(expenseCategories);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
