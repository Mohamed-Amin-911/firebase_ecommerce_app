import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/filters_row_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
          "Women's tops",
          style: appStyle(
              fw: FontWeight.w500, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Color.fromARGB(144, 155, 155, 155),
                    blurRadius: 30,
                    spreadRadius: 22,
                    offset: Offset(0, -10))
              ]),
              child: Column(
                children: [
                  const TagsListWidget(),
                  SizedBox(height: 20.h),
                  const FiltersRowWidget(),
                  SizedBox(height: 16.h),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
