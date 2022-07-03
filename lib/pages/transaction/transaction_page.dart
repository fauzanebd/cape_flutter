import 'package:cape_flutter/accounts/controller/account_controller.dart';
import 'package:cape_flutter/accounts/controller/add_account_controller.dart';
import 'package:cape_flutter/accounts/models/account.dart';
import 'package:cape_flutter/accounts/views/add_account.dart';
import 'package:cape_flutter/common/app_font.dart';
import 'package:flutter/cupertino.dart';
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
    return GetBuilder<TransactionController>(
      builder: (controller) {
        return ScreenTypeLayout(
          breakpoints: const ScreenBreakpoints(
            tablet: 600,
            desktop: 950,
            watch: 300,
          ),
          mobile: Scaffold(
            backgroundColor: AppColor.light100,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                //add account
                Get.put(AddAccountPageController(user: controller.user));
                Get.to(() => const AddAccountPage());
              },
              backgroundColor: AppColor.green100,
              child: const Icon(CupertinoIcons.add),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchAccounts();
              },
              child: SingleChildScrollView(
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
                        accounts: controller.accountList,
                        uid: controller.user.uid,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
    required this.uid,
  });

  final List<Account> accounts;
  final String uid;

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
              uid: uid,
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
    required this.uid,
  }) : super(key: key);

  final Account account;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.w),
      child: Material(
        child: InkWell(
          onTap: () {
            Get.put(AccountController(account.id!, uid));
            Get.to(
              () => AccountDetails(),
              arguments: [
                account.data!.accountName!,
                account.data!.accountBalance!,
                account.id!,
              ],
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              color: AppColor.blue100,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Center(
              child: Text(
                account.data!.accountName!,
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
