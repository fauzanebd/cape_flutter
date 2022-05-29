import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'budget_controller.dart';

class BudgetPage extends GetView<BudgetController> {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Budget page'),
        ),
      ),
    );
  }
}
