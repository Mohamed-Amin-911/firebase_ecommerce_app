import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class CategoriesTabsWidget extends StatelessWidget {
  const CategoriesTabsWidget({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabAlignment: TabAlignment.center,
      indicatorWeight: 3,
      labelPadding: EdgeInsets.symmetric(horizontal: 32.w),
      labelStyle:
          appStyle(fw: FontWeight.w500, size: 16.sp, color: kColor.textColor),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: kColor.redColor,
      labelColor: kColor.textColor,
      unselectedLabelColor: kColor.textColor,
      tabs: const <Widget>[
        Tab(
          text: "Women",
        ),
        Tab(
          text: "Men",
        ),
        Tab(
          text: "Kids",
        ),
      ],
    );
  }
}
