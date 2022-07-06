import 'package:cape_flutter/auth/controllers/load_auth_controller.dart';
import 'package:cape_flutter/expense/model/expense.dart';
import 'package:cape_flutter/income/model/income.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../accounts/controller/account_controller.dart';
import '../../accounts/models/account.dart';
import '../dashboard/dashboard_controller.dart';
import '../../api/api_service.dart';

class HomeController extends GetxController {
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  var isLoading = true.obs;
  var isAccountEmpty = true.obs;
  var isIncomeEmpty = true.obs;
  var isExpenseEmpty = true.obs;

  RxList<Income> incomeList = <Income>[].obs;
  RxList<Expense> expenseList = <Expense>[].obs;
  RxList<Account> accountList = <Account>[].obs;

  final String title = 'Home page';
  User user = Get.find<DashboardController>().user;

  @override
  void onInit() {
    super.onInit();
    updateData();
  }

  // @override
  // void onReady() {

  //   super.onReady();
  // }
  void updateData() {
    fetchAccounts();
    fetchIncomes();
    fetchExpenses();
  }

  Future<void> fetchIncomes() async {
    try {
      isLoading(true);
      var income = await ApiService.fetchIncomes(user.uid);
      if (income != null) {
        incomeList.assignAll(income);
        isIncomeEmpty(false);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchExpenses() async {
    try {
      isLoading(true);
      var expense = await ApiService.fetchExpenses(user.uid);
      if (expense != null) {
        expenseList.assignAll(expense);
        isExpenseEmpty(false);
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> fetchAccounts() async {
    try {
      isLoading(true);
      var account = await ApiService.fetchAccounts(user.uid);
      if (account != null) {
        accountList.assignAll(account);
        isAccountEmpty(false);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
