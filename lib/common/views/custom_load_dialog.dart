import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_color.dart';

class CustomLoadDialog {
  static void showDialog({
    Color barrierColor = AppColor.blue100,
  }) {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.light100),
            ),
          ),
        ),
        onWillPop: () async => false,
      ),
      barrierDismissible: false,
      barrierColor: barrierColor,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
