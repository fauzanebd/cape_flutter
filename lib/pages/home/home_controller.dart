import 'package:cape_flutter/auth/controllers/load_auth_controller.dart';
import 'package:cape_flutter/expense/model/expense.dart';
import 'package:cape_flutter/income/model/income.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../accounts/models/account.dart';
import '../dashboard/dashboard_controller.dart';
import '../../api/api_service.dart';

class HomeController extends GetxController {
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  var isLoading = true.obs;
  var incomeList = <Income>[].obs;
  var expenseList = <Expense>[].obs;
  var accountList = <Account>[].obs;

  final String title = 'Home page';
  User user = Get.find<DashboardController>().user;

  @override
  void onInit() {
    super.onInit();
    fetchIncomes(user.uid);
    fetchExpenses(user.uid);
    fetchAccounts(user.uid);
  }

  // @override
  // void onReady() {

  //   super.onReady();
  // }

  Future<void> fetchIncomes(String userId) async {
    try {
      isLoading(true);
      var income = await ApiService.fetchIncomes(userId);
      if (income != null) {
        incomeList.assignAll(income);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchExpenses(String userId) async {
    try {
      isLoading(true);
      var expense = await ApiService.fetchExpenses(userId);
      if (expense != null) {
        expenseList.assignAll(expense);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchAccounts(String userId) async {
    try {
      isLoading(true);
      var account = await ApiService.fetchAccounts(userId);
      if (account != null) {
        accountList.assignAll(account);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
