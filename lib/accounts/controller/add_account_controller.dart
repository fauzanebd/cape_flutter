import 'package:cape_flutter/accounts/views/add_account.dart';
import 'package:cape_flutter/api/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountPageController extends GetxController {
  AddAccountPageController({
    required this.user,
  });
  final User user;

  Rx<TextEditingController> accountNameController = TextEditingController().obs;
  Rx<TextEditingController> accountBalanceController =
      TextEditingController().obs;

  Rx<String> accountName = "".obs;
  Rx<String> accountBalance = "".obs;

  Future<void> addAccount() async {
    String res = (await ApiService.addAccount(
      userId: user.uid,
      accountName: accountName.value,
      accountBalance: accountBalance.value,
    ))!;
    print(res);
    Get.back();
    // Get.off(const AddAccountPage());
    // Get.delete(AddAccountPageController());
  }
}
