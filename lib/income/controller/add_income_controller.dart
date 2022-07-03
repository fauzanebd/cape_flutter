import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../api/api_service.dart';

class AddIncomePageController extends GetxController {
  AddIncomePageController({
    required this.userId,
    required this.incomeCategoryId,
  });

  final String userId;
  final String incomeCategoryId;

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

  Future<void> addIncome({
    required String accountId,
  }) async {
    String res = (await ApiService.addIncome(
      userId: userId,
      incomeCategoryId: incomeCategoryId,
      incomeTitle: incomeTitle.value,
      incomeAmount: int.parse(incomeAmount.value),
      incomeDetails: incomeDetails.value,
      incomeDate: DateFormat('yyyy-MM-dd').format(incomeDate.value),
      accountId: accountId,
    ))!;
    print(res);
    Get.back();
  }
}
