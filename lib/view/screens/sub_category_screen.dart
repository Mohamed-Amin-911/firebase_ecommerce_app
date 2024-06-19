import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/widgets/red_button_widget.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/sub_category_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RedButtonWidget(name: "VIEW ALL ITEMS", function: () {}),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text("Choose category",
                style: appStyle(
                    fw: FontWeight.w400, size: 14, color: kColor.textColor)),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 500.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubCategoryItemCard(name: "Tops", function: () {}),
                  SubCategoryItemCard(
                      name: "Shirts & Blouses", function: () {}),
                  SubCategoryItemCard(
                      name: "Cardigans & Sweaters", function: () {}),
                  SubCategoryItemCard(name: "Knitwear", function: () {}),
                  SubCategoryItemCard(name: "Blazers", function: () {}),
                  SubCategoryItemCard(name: "Outerwear", function: () {}),
                  SubCategoryItemCard(name: "Pants", function: () {}),
                  SubCategoryItemCard(name: "Jeans", function: () {}),
                  SubCategoryItemCard(name: "Shorts", function: () {}),
                  SubCategoryItemCard(name: "Skirts", function: () {}),
                  SubCategoryItemCard(name: "Dresses", function: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
