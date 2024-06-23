import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/products_screen.dart';
import 'package:ecommerce_app/view/widgets/red_button_widget.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/sub_category_item_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.cat, required this.gender});
  final String cat;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 0,
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
                  SubCategoryItemCard(
                      name: "Tops",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "tops",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Shirts & Blouses",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "shirtsAndBlouses",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Cardigans & Sweaters",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "cardigansAndSweaters",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Knitwear",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Knitwear",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Blazers",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Blazers",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Outerwear",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Outerwear",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Pants",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Pants",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Jeans",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Jeans",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Shorts",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Shorts",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Skirts",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Skirts",
                              ),
                            ));
                      }),
                  SubCategoryItemCard(
                      name: "Dresses",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                cat: cat,
                                gender: gender,
                                subcat: "Dresses",
                              ),
                            ));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
