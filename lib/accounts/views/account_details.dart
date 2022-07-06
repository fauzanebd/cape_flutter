import 'package:cape_flutter/common/app_color.dart';
import 'package:cape_flutter/common/app_font.dart';
import 'package:cape_flutter/income/controller/income_categories_controller.dart';
import 'package:cape_flutter/income/view/income_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../expense/controller/expense_categories_controller.dart';
import '../../expense/view/expense_categories.dart';
import '../../pages/home/home_page.dart';
import '../controller/account_controller.dart';
import '../controller/edit_account_controller.dart';
import 'edit_account.dart';

class AccountDetails extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

    return GetBuilder<AccountController>(
      builder: (controller) {
        String accountName = controller.accountName;
        int accountBalance = controller.accountBalance;
        String accountId = controller.accountId;
        return ScreenTypeLayout(
          breakpoints: ScreenBreakpoints(
            tablet: 600,
            desktop: 950,
            watch: 300,
          ),
          mobile: Scaffold(
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              children: [
                SpeedDialChild(
                  child: Icon(CupertinoIcons.arrow_up_circle),
                  label: "Add Expense",
                  backgroundColor: AppColor.red100,
                  onTap: () {
                    // Pick expense category
                    Get.put(ExpenseCategoriesController(
                      accountId: accountId,
                      userId: controller.userId,
                    ));
                    Get.to(
                      () => const ExpenseCategoriesList(),
                    );
                  },
                ),
                SpeedDialChild(
                  child: Icon(CupertinoIcons.arrow_down_circle),
                  label: "Add Income",
                  backgroundColor: AppColor.green100,
                  onTap: () {
                    // Pick income category
                    Get.put(IncomeCategoriesController(
                      accountId: accountId,
                      userId: controller.userId,
                    ));
                    Get.to(
                      () => const IncomeCategoriesList(),
                    );
                  },
                ),
                SpeedDialChild(
                  child: Icon(CupertinoIcons.pencil_circle),
                  label: "Edit Account",
                  backgroundColor: AppColor.green100,
                  onTap: () {
                    Get.put(EditAccountPageController(
                      userId: controller.userId,
                      accountId: accountId,
                      originalAccountName: accountName,
                      originalAccountBalance: accountBalance,
                    ));
                    Get.to(() => const EditAccountPage());
                  },
                ),
                SpeedDialChild(
                  child: Icon(CupertinoIcons.delete_simple),
                  label: "Delete Account",
                  backgroundColor: AppColor.green100,
                  onTap: () {
                    controller.deleteAccount();
                  },
                ),
              ],
            ),
            backgroundColor: AppColor.light100,
            body: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchIncomesbyAccountId(
                    controller.accountId, controller.userId);
                await controller.fetchExpensesbyAccountId(
                    controller.accountId, controller.userId);
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 10.w,
                    ),
                    PageHeader(
                      title: "$accountName",
                      balance: accountBalance,
                      icon: Icon(CupertinoIcons.money_dollar_circle_fill),
                    ),
                    Obx(
                      () {
                        if (controller.incomeList.isEmpty &&
                            controller.expenseList.isEmpty) {
                          return Container(
                            padding: EdgeInsets.only(
                              right: 10.w,
                              left: 10.w,
                              top: 10.w,
                              bottom: 10.w,
                            ),
                            child: Center(
                              child: Text("No transactions yet",
                                  style: AppFont.title3(fontSize: 18.sp)),
                            ),
                          );
                        } else {
                          return Column(
                            children: <Widget>[
                              TitleOfSubElement(
                                title: "Recent Income",
                                onSeeAll: () {},
                              ),
                              IncomeListTile(
                                incomeList: controller.incomeList,
                              ),
                              TitleOfSubElement(
                                title: "Recent Expense",
                                onSeeAll: () {},
                              ),
                              ExpenseListTile(
                                expenseList: controller.expenseList,
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader(
      {Key? key,
      required this.title,
      required this.balance,
      required this.icon})
      : super(key: key);

  final String title;
  final int balance;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      height: 150.w,
      decoration: BoxDecoration(
        color: AppColor.blue100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(flex: 3, child: SizedBox()),
          Text(
            "$title",
            style: AppFont.body3(
              fontSize: 14.sp,
              fontColor: AppColor.light100,
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Text(
            "Rp. ${balance.round()}",
            style: AppFont.title2(
              fontSize: 40.sp,
              fontColor: AppColor.light100,
            ),
          ),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
