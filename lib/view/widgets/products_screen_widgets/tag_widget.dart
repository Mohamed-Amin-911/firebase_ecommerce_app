import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7.w),
      width: 100.w,
      height: 30.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29), color: kColor.textColor),
      child: Center(
        child: Text(
          name,
          style: appStyle(
              fw: FontWeight.w500, size: 14.sp, color: kColor.whiteColor),
        ),
      ),
    );
  }
}
