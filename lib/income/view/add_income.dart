import 'package:cape_flutter/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/app_font.dart';
import '../controller/add_income_controller.dart';

class AddIncomePage extends GetView<AddIncomePageController> {
  const AddIncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );
    return GetBuilder<AddIncomePageController>(
      builder: (controller) {
        String accountId = controller.accountId;
        return ScreenTypeLayout(
          breakpoints:
              const ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
          mobile: Scaffold(
            backgroundColor: AppColor.light100,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Expanded(child: SizedBox()),
                      SizedBox(height: 80.w),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "New Income",
                            style: AppFont.title2(),
                          ),
                        ],
                      ),
                      TextField(
                        controller: controller.incomeTitleController.value,
                        onChanged: (val) {
                          controller.incomeTitle.value = val;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Income Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      TextField(
                        controller: controller.incomeAmountController.value,
                        onChanged: (val) {
                          controller.incomeAmount.value = val;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Income Amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      TextField(
                        controller: controller.incomeDetailsController.value,
                        onChanged: (val) {
                          controller.incomeDetails.value = val;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Income Details',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime(2022, 6, 1),
                                maxTime: DateTime(2025, 6, 7),
                                onConfirm: (date) {
                                  var originDate = controller.incomeDate.value;
                                  var pickedDate = DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    controller.incomeDate.value.hour,
                                    controller.incomeDate.value.minute,
                                  );
                                  controller.updateDate(pickedDate);
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.id,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.blue100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Pick expense Date:",
                                style: AppFont.body1(
                                  fontColor: AppColor.light100,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(controller.incomeDate.value),
                            style: AppFont.body1(
                              fontColor: AppColor.dark100,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.w),
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
                          await controller.addIncome(
                            accountId: accountId,
                          );
                        },
                        child: Text(
                          'Add Income',
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
      },
    );
  }
}
