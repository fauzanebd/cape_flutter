import 'package:cape_flutter/common/app_color.dart';
import 'package:cape_flutter/expense/controller/add_expense_controller.dart';
import 'package:cape_flutter/expense/model/expense_category.dart';
import 'package:cape_flutter/expense/view/add_expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/app_font.dart';
import '../controller/expense_categories_controller.dart';

class ExpenseCategoriesList extends GetView<ExpenseCategoriesController> {
  const ExpenseCategoriesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );
    return GetBuilder<ExpenseCategoriesController>(
      builder: (controller) {
        var accountId = controller.accountId;
        var userId = controller.userId;
        return ScreenTypeLayout(
          breakpoints: const ScreenBreakpoints(
            tablet: 600,
            desktop: 950,
            watch: 300,
          ),
          mobile: Scaffold(
            backgroundColor: AppColor.light100,
            body: RefreshIndicator(
              onRefresh: () async {
                // get list of indicator
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Obx(
                  () {
                    if (controller.expenseCategoriesList.isEmpty) {
                      return Center(
                        child: Text("No expense categories"),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Expanded(child: SizedBox()),
                          SizedBox(height: 80.w),
                          TitleOfSub(title: "Pick expense category: "),
                          ListOfCategories(
                            expenseCategoriesList:
                                controller.expenseCategoriesList,
                            accountId: accountId,
                            userId: userId,
                          ),
                          // Expanded(child: SizedBox()),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TitleOfSub extends StatelessWidget {
  const TitleOfSub({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    late Widget titleWidget;

    titleWidget = Padding(
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 2.w,
        bottom: 2.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppFont.title3(fontSize: 18.sp),
          ),
          Expanded(child: SizedBox(height: 10.w))
        ],
      ),
    );

    return titleWidget;
  }
}

class ListOfCategories extends StatelessWidget {
  const ListOfCategories({
    Key? key,
    required this.expenseCategoriesList,
    required this.accountId,
    required this.userId,
  });

  final List<ExpenseCategory> expenseCategoriesList;
  final String accountId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: expenseCategoriesList.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
              title: Text(
                expenseCategoriesList[index].data!.categoryName!,
                style: AppFont.body3(
                  fontSize: 16.sp,
                ),
              ),
              leading: Container(
                padding: const EdgeInsets.only(
                  right: 12.0,
                  left: 12.0,
                  bottom: 12.0,
                  top: 4.0,
                ),
                child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: const Icon(CupertinoIcons.circle_fill, size: 28),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: 10.w,
              right: 10.w,
              top: 5.w,
              bottom: 5.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.w),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Get.to(PlaceDetails(), arguments: place);
                      Get.put(
                        AddExpensePageController(
                          userId: userId,
                          expenseCategoryId: expenseCategoriesList[index].id!,
                          accountId: accountId,
                        ),
                      );
                      Get.to(
                        () => const AddExpensePage(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
