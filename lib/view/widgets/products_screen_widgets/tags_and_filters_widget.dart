import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/constants/colors.dart';

class TagsAndFiltersWidget extends StatelessWidget {
  const TagsAndFiltersWidget({super.key, required this.filter});
  final Future<dynamic> filter;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.filter_list_rounded,
                    color: kColor.textColor,
                  ),
                ),
                Text(
                  " Filters",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
              ]),
              Row(children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.swap_vert,
                    color: kColor.textColor,
                  ),
                ),
                Text(
                  " Price: lowest to high",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
              ]),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.view_list_rounded,
                  color: kColor.textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
