import 'package:cape_flutter/common/app_color.dart';
import 'package:cape_flutter/common/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );

    return ScreenTypeLayout(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Scaffold(
        backgroundColor: AppColor.light100,
        // appBar: appBarCape,
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const AppBarWidget(),
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

class TitleOfSubElement extends StatelessWidget {
  const TitleOfSubElement({
    Key? key,
    required this.title,
    required this.onSeeAll,
  }) : super(key: key);

  final String title;
  final onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 9.w,
        bottom: 9.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: AppFont.title3(fontSize: 18.sp),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(32.w),
            child: Container(
              width: 78,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColor.violet20,
              ),
              child: TextButton(
                onPressed: () {
                  onSeeAll();
                },
                child: Center(
                  child: Text(
                    "See All",
                    style: AppFont.body2(
                      fontSize: 14.sp,
                      fontColor: AppColor.violet100,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    Key? key,
    this.title = "",
    this.subtitle = "",
    this.icon = const Icon(CupertinoIcons.circle_fill),
    this.amount = 0,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Icon icon;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ListCard(
          title: "Beli ban",
          subtitle: "Transportasi",
          amount: 1000000,
          icon: const Icon(CupertinoIcons.circle),
          index: index,
        );
      },
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard(
      {Key? key,
      this.title = "",
      this.subtitle = "",
      this.icon = const Icon(CupertinoIcons.circle_fill),
      this.amount = 0,
      this.index = 0})
      : super(key: key);

  final String title;
  final String subtitle;
  final Icon icon;
  final int amount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
        title: Text(
          title,
          style: AppFont.body3(
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppFont.body3(
            fontSize: 13.sp,
            fontColor: AppColor.light20,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            bottom: 12.0,
            top: 4.0,
          ),
          child: SizedBox(
            width: 20,
            height: 20,
            child: Center(
              child: Icon(icon.icon, size: 28),
            ),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0),
          child: Text(
            amount.toString(),
            style: AppFont.body3(fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    this.balance = 0,
    this.fullName = "",
    this.income = 10000,
    this.expense = 500,
  });
  final double balance;
  final String fullName;
  final double income;
  final double expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.w, bottom: 9.w),
      child: Container(
        width: double.infinity,
        height: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.w),
            bottomRight: Radius.circular(24.w),
          ),
          color: Color(0xFFFFF6E5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(child: SizedBox()),
            Row(
              children: <Widget>[
                const Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Total Balance:",
                        style: AppFont.body3(
                            fontSize: 14.sp, fontColor: AppColor.light20),
                      ),
                      Text(
                        "Rp. ${balance.round()}",
                        style: AppFont.title2(
                          fontSize: 40.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(child: SizedBox()),
                MainInfoBox(
                  amount: income,
                  title: "Income",
                  backgroundColor: AppColor.green100,
                ),
                const Expanded(child: SizedBox()),
                MainInfoBox(
                  amount: expense,
                  title: "Expense",
                  backgroundColor: AppColor.red100,
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class MainInfoBox extends StatelessWidget {
  const MainInfoBox({
    this.amount = 0.0,
    this.title = "",
    this.backgroundColor = AppColor.red100,
  });
  final double amount;
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.0.w),
      height: 60.w,
      width: 164.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0.w),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 8.w,
          ),
          const Icon(
            CupertinoIcons.arrow_down_right_square_fill,
            color: AppColor.light100,
            size: 28,
          ),
          SizedBox(
            width: 9.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(flex: 2, child: SizedBox()),
              Text(
                title,
                style: AppFont.body3(
                  fontSize: 12.sp,
                  fontColor: AppColor.light100,
                ),
              ),
              const Expanded(flex: 0, child: SizedBox()),
              Text(
                "Rp ${amount.round()}",
                style: AppFont.body1(
                  fontSize: 16.sp,
                  fontColor: AppColor.light100,
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
          SizedBox(
            width: 8.w,
          ),
        ],
      ),
    );
  }
}

final appBarCape = AppBar(
  backgroundColor: AppColor.dark100,
  // title: SvgPicture.asset('assets/icons/cape_logo.svg'),
  elevation: 0,
  leading: SizedBox(
    width: 20.w,
    height: 20.w,
    child: Center(
      child: TextButton(
        onPressed: () {
          print("pergi ke profile");
        },
        child: const Icon(
          CupertinoIcons.person_alt_circle,
          color: AppColor.dark100,
          size: 40,
        ),
      ),
    ),
  ),
  leadingWidth: 70.w,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Expanded(
        flex: 10,
        child: SizedBox(),
      ),
      SvgPicture.asset('assets/icons/cape_logo.svg'),
      const Expanded(
        flex: 0,
        child: SizedBox(),
      ),
    ],
  ),
  centerTitle: true,
);
