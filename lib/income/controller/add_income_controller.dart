import 'package:cape_flutter/accounts/controller/account_controller.dart';
import 'package:cape_flutter/pages/home/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../accounts/controller/account_controller.dart';
import '../../api/api_service.dart';
import '../../common/views/custom_load_dialog.dart';

class AddIncomePageController extends GetxController {
  AddIncomePageController({
    required this.userId,
    required this.incomeCategoryId,
    required this.accountId,
  });

  final String userId;
  final String incomeCategoryId;
  final String accountId;
  final accountController = Get.find<AccountController>();
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    // fetchIncomeCategories(user.uid);
  }

  Rx<TextEditingController> incomeTitleController = TextEditingController().obs;
  Rx<TextEditingController> incomeAmountController =
      TextEditingController().obs;
  Rx<TextEditingController> incomeDetailsController =
      TextEditingController().obs;

  Rx<String> incomeTitle = "".obs;
  Rx<String> incomeAmount = "".obs;
  Rx<String> incomeDetails = "".obs;
  Rx<DateTime> incomeDate = DateTime.now().obs;

  void updateDate(DateTime newDate) {
    incomeDate.value = newDate;
    update();
  }

  Future<void> addIncome({
    required String accountId,
  }) async {
    CustomLoadDialog.showDialog(barrierColor: Colors.black.withOpacity(0.5));
    String res = (await ApiService.addIncome(
      userId: userId,
      incomeCategoryId: incomeCategoryId,
      incomeTitle: incomeTitle.value,
      incomeAmount: incomeAmount.value,
      incomeDetails: incomeDetails.value,
      incomeDate: DateFormat('yyyy-MM-dd').format(incomeDate.value),
      accountId: accountId,
    ))!;
    print(res);

    accountController.addBalance(addition: int.parse(incomeAmount.value));
    homeController.update();
    CustomLoadDialog.cancelDialog();
    Get.close(2);
  }
}
