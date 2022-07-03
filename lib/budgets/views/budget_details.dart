import 'package:cape_flutter/common/app_color.dart';
import 'package:cape_flutter/common/app_font.dart';
import 'package:cape_flutter/debt/model/debt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../pages/budget/budget_controller.dart';
import '../../pages/home/home_page.dart';
import '../../plan/model/plan.dart';

class BudgetDetails extends StatelessWidget {
  String budgetTitle = "Bankbca";
  double budgetAmount = 2140000;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

    return GetBuilder<BudgetController>(
      builder: (controller) {
        return ScreenTypeLayout(
          breakpoints: ScreenBreakpoints(
            tablet: 600,
            desktop: 950,
            watch: 300,
          ),
          mobile: Scaffold(
            backgroundColor: AppColor.light100,
            body: SingleChildScrollView(
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
                    title: "$budgetTitle",
                    balance: budgetAmount,
                    icon: Icon(CupertinoIcons.money_dollar_circle_fill),
                  ),
                  TitleOfSubElement(
                    title: "Debts",
                    onSeeAll: () {},
                  ),
                  DebtListTile(
                    debtList: controller.debtList,
                  ),
                  TitleOfSubElement(
                    title: "Plans",
                    onSeeAll: () {},
                  ),
                  PlanListTile(
                    planList: controller.planList,
                  ),
                ],
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
  final double balance;
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

class DebtListTile extends StatelessWidget {
  const DebtListTile({
    Key? key,
    required this.debtList,
    this.icon = const Icon(CupertinoIcons.circle_fill),
  }) : super(key: key);

  final List<Debt> debtList;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: debtList.length,
      itemBuilder: (context, index) {
        return ListCard(
          title: debtList[index].data!.debtTitle!,
          subtitle: debtList[index].data!.debtDetails!,
          amount: debtList[index].data!.debtAmount!,
          icon: icon,
          index: index,
        );
      },
    );
  }
}

class PlanListTile extends StatelessWidget {
  const PlanListTile({
    Key? key,
    required this.planList,
    this.icon = const Icon(CupertinoIcons.circle_fill),
  }) : super(key: key);

  final List<Plan> planList;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: planList.length,
      itemBuilder: (context, index) {
        return ListCard(
          title: planList[index].data!.planTitle!,
          subtitle: planList[index].data!.planDetails!,
          amount: planList[index].data!.targetAmount!,
          icon: icon,
          index: index,
        );
      },
    );
  }
}
