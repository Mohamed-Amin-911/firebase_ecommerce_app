import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingNumber extends StatelessWidget {
  const RatingNumber({
    super.key,
    required this.no,
  });
  final String no;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        no,
        style: appStyle(
            fw: FontWeight.w500, size: 14.sp, color: kColor.text2Color),
      ),
    );
  }
}
