import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoadDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.amber,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
