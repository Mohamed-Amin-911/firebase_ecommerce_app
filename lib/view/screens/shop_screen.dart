import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kColor.textColor,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: kColor.textColor,
                ))
          ],
          centerTitle: true,
          title: Text(
            "Categories",
            style: appStyle(
                fw: FontWeight.w500, size: 18.sp, color: kColor.textColor),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              tabAlignment: TabAlignment.center,
              indicatorWeight: 3,
              labelPadding: EdgeInsets.symmetric(horizontal: 32.w),
              labelStyle: appStyle(
                  fw: FontWeight.w500, size: 16.sp, color: kColor.textColor),
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
            ),
          ],
        ),
      ),
    );
  }
}
