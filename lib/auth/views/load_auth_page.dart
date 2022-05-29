import 'package:cape_flutter/Auth/controllers/load_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadAuthPage extends GetView<LoadAuthController> {
  const LoadAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}
