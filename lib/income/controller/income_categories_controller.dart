import 'package:cape_flutter/income/model/income.dart';
import 'package:cape_flutter/income/model/income_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_service.dart';
import '../../common/views/custom_load_dialog.dart';

class IncomeCategoriesController extends GetxController {
  IncomeCategoriesController({
    required this.userId,
    required this.accountId,
  });

  final String userId;
  final String accountId;

  var isLoading = true.obs;
  var incomeCategoriesList = <IncomeCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    CustomLoadDialog.showDialog(barrierColor: Colors.black.withOpacity(0.5));
    fetchIncomeCategories();
    CustomLoadDialog.cancelDialog();
  }

  Future<void> fetchIncomeCategories() async {
    try {
      isLoading(true);
      var incomeCategories = await ApiService.fetchIncomeCategories();
      if (incomeCategories != null) {
        incomeCategoriesList.assignAll(incomeCategories);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
