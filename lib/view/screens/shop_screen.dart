import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/categories_tabs_widget.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/kids_categories_list.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/men_categories_list.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/summer_sale_widget.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/women_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColor.whiteColor,
          elevation: 0,
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
            CategoriesTabsWidget(
              tabController: _tabController,
            ),
            SizedBox(height: 16.h),
            const SummerSaleWidget(),
            SizedBox(height: 16.h),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    WomenCategoriesList(),
                    MenCategoriesList(),
                    KidsCategoriesList()
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
