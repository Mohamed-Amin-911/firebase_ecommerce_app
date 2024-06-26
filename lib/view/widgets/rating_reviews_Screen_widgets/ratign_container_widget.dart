import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
    required this.width,
  });
  final int width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        width: width.w,
        height: 8.h,
        decoration: BoxDecoration(
            color: kColor.redColor, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
