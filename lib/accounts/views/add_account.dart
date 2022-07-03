import 'package:cape_flutter/accounts/controller/add_account_controller.dart';
import 'package:cape_flutter/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddAccountPage extends GetView<AddAccountPageController> {
  const AddAccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );
    return ScreenTypeLayout(
      breakpoints:
          const ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
      mobile: Scaffold(
        backgroundColor: AppColor.light100,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              right: 35.w,
              left: 35.w,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox()),
                  const SizedBox(height: 20),
                  Text("Account Name"),
                  TextField(
                    controller: controller.accountNameController.value,
                    onChanged: (val) {
                      controller.accountName.value = val;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Account Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Account Initial Balance"),
                  TextField(
                    controller: controller.accountBalanceController.value,
                    onChanged: (val) {
                      controller.accountBalance.value = val;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Account Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                      fixedSize: Size(
                        300.w,
                        60.w,
                      ),
                      primary: AppColor.blue100,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.w),
                    ),
                    onPressed: () async {
                      // getting invoice
                      // await reservationDetailsController.goToPaymentPage();
                      await controller.addAccount();
                    },
                    child: Text(
                      'Add Account',
                      style: TextStyle(
                        color: AppColor.light100,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
