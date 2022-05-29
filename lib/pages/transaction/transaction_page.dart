import 'package:cape_flutter/common/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../accounts/views/account_details.dart';
import '../../common/app_color.dart';
import 'transaction_controller.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const TitleOfSubElement(
                title: "Accounts",
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                  top: 10.w,
                  bottom: 10.w,
                ),
                child: GridOfAccounts(
                  accounts: [
                    "Account 1",
                    "Account 2",
                    "Account 3",
                    "Account 4"
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return const Scaffold(
    //   body: Center(
    //     child: Text('Transaction Page'),
    //   ),
    // );
  }
}

class GridOfAccounts extends StatelessWidget {
  const GridOfAccounts({
    Key? key,
    required this.accounts,
  });

  final List<String> accounts;

  @override
  Widget build(BuildContext context) {
    const int column = 2;
    int row = (accounts.length / column).ceil();

    return Container(
      height: 1000,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: (row * column),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: column,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.w,
        ),
        itemBuilder: (context, index) {
          if (index < accounts.length) {
            return AccountCard(
              account: accounts[index],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key? key,
    required this.account,
  }) : super(key: key);

  final String account;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.w),
      child: Material(
        child: InkWell(
          onTap: () {
            Get.to(() => AccountDetails());
          },
          child: Ink(
            decoration: BoxDecoration(
              color: AppColor.blue100,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Center(
              child: Text(
                "$account",
                style: AppFont.body2(fontColor: AppColor.light100),
              ),
            ),
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
  }) : super(key: key);

  final String title;

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
        ],
      ),
    );
  }
}
