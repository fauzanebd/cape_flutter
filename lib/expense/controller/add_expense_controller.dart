import 'dart:io';

import 'package:cape_flutter/accounts/controller/account_controller.dart';
import 'package:cape_flutter/invoice/model/invoice.dart';
import 'package:cape_flutter/pages/home/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../accounts/controller/account_controller.dart';
import '../../api/api_service.dart';
import '../../common/views/custom_load_dialog.dart';

class AddExpensePageController extends GetxController {
  AddExpensePageController({
    required this.userId,
    required this.expenseCategoryId,
    required this.accountId,
  });

  final String userId;
  final String expenseCategoryId;
  final String accountId;
  final accountController = Get.find<AccountController>();
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    // fetchIncomeCategories(user.uid);
  }

  Rx<TextEditingController> expenseTitleController =
      TextEditingController().obs;
  Rx<TextEditingController> expenseAmountController =
      TextEditingController().obs;
  Rx<TextEditingController> expenseDetailsController =
      TextEditingController().obs;

  var isLoading = true.obs;

  Rx<String> expenseTitle = "".obs;
  Rx<String> expenseAmount = "".obs;
  Rx<String> expenseDetails = "".obs;
  Rx<DateTime> expenseDate = DateTime.now().obs;

  // File? image;

  void updateDate(DateTime newDate) {
    expenseDate.value = newDate;
    update();
  }

  Future<void> addExpense({
    required String accountId,
  }) async {
    CustomLoadDialog.showDialog(barrierColor: Colors.black.withOpacity(0.5));
    String res = (await ApiService.addExpense(
      userId: userId,
      expenseCategoryId: expenseCategoryId,
      expenseTitle: expenseTitle.value,
      expenseAmount: (int.parse(expenseAmount.value) * -1).toString(),
      expenseDetails: expenseDetails.value,
      expenseDate: DateFormat('yyyy-MM-dd').format(expenseDate.value),
      accountId: accountId,
    ))!;
    print(res);

    accountController.addBalance(
        addition: (int.parse(expenseAmount.value) * -1));
    homeController.update();
    CustomLoadDialog.cancelDialog();
    Get.close(2);
  }

  Future<void> pickImageFromGallery() async {
    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        final imageTemporary = File(image.path);
        isLoading(true);
        CustomLoadDialog.showDialog(
            barrierColor: Colors.black.withOpacity(0.5));
        var invoiceData =
            await ApiService.scanInvoice(imageFile: imageTemporary);
        if (invoiceData != null) {
          expenseTitle.value = invoiceData.data!.items!;
          expenseTitleController.value.text = invoiceData.data!.items!;
          expenseDetails.value = invoiceData.data!.merchantName!;
          expenseDetailsController.value.text = invoiceData.data!.merchantName!;
          expenseAmount.value = invoiceData.data!.total!.toString();
          expenseAmountController.value.text =
              invoiceData.data!.total!.toString();
          expenseDate.value = invoiceData.data!.transactionDate!;
          update();
          print("data from invoice scan");
        }
        CustomLoadDialog.cancelDialog();
      }
    } on PlatformException catch (e) {
      print("Error while picking image: ${e.message}");
      CustomLoadDialog.cancelDialog();
      Get.snackbar(
        'Scan Failed',
        'Error picking image',
        icon: Icon(Icons.error),
        backgroundColor: Colors.red,
      );
    } catch (e) {
      CustomLoadDialog.cancelDialog();
      Get.snackbar(
        'Scan Failed',
        'Unsupported invoice type',
        icon: Icon(Icons.error),
        backgroundColor: Colors.red,
      );
    }
  }

  Future pickImageFromCamera() async {
    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (image != null) {
        final imageTemporary = File(image.path);
        isLoading(true);
        var invoiceData =
            await ApiService.scanInvoice(imageFile: imageTemporary);
        if (invoiceData != null) {
          expenseTitle.value = invoiceData.data!.items!;
          expenseTitleController.value.text = invoiceData.data!.items!;
          expenseDetails.value = invoiceData.data!.merchantName!;
          expenseDetailsController.value.text = invoiceData.data!.merchantName!;
          expenseAmount.value = invoiceData.data!.total!.toString();
          expenseAmountController.value.text =
              invoiceData.data!.total!.toString();
          expenseDate.value = invoiceData.data!.transactionDate!;
          update();
          print("data from invoice scan");
        }
      }
    } on PlatformException catch (e) {
      print("Error while picking image: ${e.message}");
    }
  }
}
