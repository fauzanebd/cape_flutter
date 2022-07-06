import 'package:get/get.dart';

import '../controller/account_controller.dart';

class AccountDetailsBindings extends Bindings {
  AccountDetailsBindings({
    required this.accountId,
    required this.userId,
    required this.accountName,
    required this.accountBalance,
  });

  final String accountId;
  final String userId;
  final String accountName;
  final int accountBalance;

  @override
  void dependencies() {
    Get.put<AccountController>(
      AccountController(
        accountId: accountId,
        userId: userId,
        accountName: accountName,
        accountBalance: accountBalance,
      ),
    );
  }
}
