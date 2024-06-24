import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummerSaleWidget extends StatelessWidget {
  const SummerSaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 77, vertical: 28),
      width: 343.w,
      height: 100.h,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: kColor.redColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SUMMER SALES",
            style: appStyle(
                fw: FontWeight.w600, size: 24, color: kColor.whiteColor),
          ),
          Text(
            "Up to 50% off",
            style: appStyle(
                fw: FontWeight.w500, size: 14, color: kColor.whiteColor),
          )
        ],
      ),
    );
  }
}
