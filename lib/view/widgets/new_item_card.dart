import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class NewItemCard extends StatelessWidget {
  const NewItemCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Stack(
        children: [
          Image.asset(image),
          Positioned(
            top: 8.h,
            left: 3.h,
            child: Stack(
              children: [
                Container(
                  width: 40.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                ),
                Positioned(
                  top: 6.h,
                  left: 7.w,
                  child: Text(
                    "NEW",
                    style: appStyle(
                        fw: FontWeight.w600,
                        size: 11,
                        color: kColor.whiteColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
