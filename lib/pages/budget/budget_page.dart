import 'package:cape_flutter/plan/model/plan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/app_color.dart';
import '../../debt/model/debt.dart';
import '../home/home_page.dart';
import 'budget_controller.dart';

class BudgetPage extends GetView<BudgetController> {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userId = 'klkll';
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );

    return GetBuilder<BudgetController>(
      builder: (controller) {
        return ScreenTypeLayout(
          breakpoints: const ScreenBreakpoints(
            tablet: 600,
            desktop: 950,
            watch: 300,
          ),
          mobile: Scaffold(
            backgroundColor: AppColor.light100,
            // appBar: appBarCape,
            body: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchDebts(userId);
                await controller.fetchPlans(userId);
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TitleOfSubElement(
                      title: "Recent Debt",
                      onSeeAll: () {},
                      disableSeeAllButton: true,
                    ),
                    DebtListTile(
                      debtList: controller.debtList,
                    ),
                    TitleOfSubElement(
                      title: "Recent Plan",
                      onSeeAll: () {},
                      disableSeeAllButton: true,
                    ),
                    PlanListTile(
                      planList: controller.planList,
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
