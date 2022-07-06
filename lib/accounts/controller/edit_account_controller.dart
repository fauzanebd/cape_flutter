import 'package:cape_flutter/accounts/views/add_account.dart';
import 'package:cape_flutter/api/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_controller.dart';

class EditAccountPageController extends GetxController {
  EditAccountPageController({
    required this.userId,
    required this.accountId,
    required this.originalAccountName,
    required this.originalAccountBalance,
  });

  final String userId;
  final String accountId;
  String originalAccountName;
  int originalAccountBalance;

  AccountController accountController = Get.find<AccountController>();

  Rx<TextEditingController> accountNameController = TextEditingController().obs;
  Rx<TextEditingController> accountBalanceController =
      TextEditingController().obs;

  var isLoading = true.obs;
  Rx<String> accountName = "".obs;
  Rx<String> accountBalance = "".obs;

  Future<void> updateAccount() async {
    if (accountName == "") {
      accountName.value = originalAccountName;
    }
    if (accountBalance == "") {
      accountBalance.value = originalAccountBalance.toString();
    }
    originalAccountName = accountName.value;
    originalAccountBalance = int.parse(accountBalance.value);
    isLoading(true);
    accountController.updateAccount(
      accountName: accountName.value,
      accountBalance: accountBalance.value,
    );
    Get.close(1);
  }
}
