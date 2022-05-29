import 'package:cape_flutter/common/app_color.dart';
import 'package:cape_flutter/common/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../pages/home/home_page.dart';

class AccountDetails extends StatelessWidget {
  String accountName = "Bankbca";
  String accountNumber = "123456789";
  double accountBalance = 1000000.0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

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
                title: "$accountName",
                balance: accountBalance,
                icon: Icon(CupertinoIcons.money_dollar_circle_fill),
              ),
              TitleOfSubElement(
                title: "Recent Income",
                onSeeAll: () {},
              ),
              TransactionListTile(),
              TitleOfSubElement(
                title: "Recent Expense",
                onSeeAll: () {},
              ),
              TransactionListTile(),
            ],
          ),
        ),
      ),
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
