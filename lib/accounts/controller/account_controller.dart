import 'package:cape_flutter/api/api_service.dart';
import 'package:cape_flutter/income/model/income.dart';
import 'package:cape_flutter/pages/transaction/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/views/custom_load_dialog.dart';
import '../../expense/model/expense.dart';

class AccountController extends GetxController {
  AccountController({
    required this.accountId,
    required this.userId,
    required this.accountName,
    required this.accountBalance,
  });

  TransactionController transactionController =
      Get.find<TransactionController>();

  final String accountId;
  final String userId;
  String accountName;
  int accountBalance;

  Rx<int> renderedBalance = 0.obs;
  Rx<String> renderedName = "".obs;
  var isLoading = true.obs;
  var incomeList = <Income>[].obs;
  var expenseList = <Expense>[].obs;

  @override
  void onInit() {
    renderedBalance.value = accountBalance;
    renderedName.value = accountName;
    // CustomLoadDialog.showDialog(barrierColor: Colors.black.withOpacity(0.5));
    fetchIncomesbyAccountId(accountId, userId);
    fetchExpensesbyAccountId(accountId, userId);
    // CustomLoadDialog.cancelDialog();
    super.onInit();
  }

  Future<void> fetchIncomesbyAccountId(String accountId, String userId) async {
    try {
      print("Fetching data for accoountId $accountId");
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

  Future<void> updateAccount({
    String accountName = "",
    String accountBalance = "",
  }) async {
    if (accountName == "") {
      accountName = this.accountName;
    }
    if (accountBalance == "") {
      accountBalance = this.accountBalance.toString();
    }
    try {
      this.accountName = accountName;
      this.accountBalance = int.parse(accountBalance);
      isLoading(true);
      var res = await ApiService.updateAccount(
        userId: userId,
        accountId: accountId,
        accountName: accountName,
        accountBalance: accountBalance,
      );
      renderedBalance.value = int.parse(accountBalance);
      renderedName.value = accountName;
      fetchIncomesbyAccountId(accountId, userId);
      fetchExpensesbyAccountId(accountId, userId);
      print(res);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> addBalance({
    required int addition,
  }) async {
    try {
      accountBalance = accountBalance + addition;
      renderedBalance.value = accountBalance;
      updateAccount(accountBalance: accountBalance.toString());
    } finally {
      update();
    }
  }

  Future<void> deleteAccount() async {
    try {
      isLoading(true);
      var res = await ApiService.deleteAccount(
        userId: userId,
        accountId: accountId,
      );
      print(res);
    } finally {
      isLoading(false);
      transactionController.fetchAccounts();
      Get.close(1);
    }
  }
}
