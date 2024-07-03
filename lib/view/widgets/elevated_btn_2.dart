import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedBtn2 extends StatelessWidget {
  const ElevatedBtn2({
    super.key,
    required this.function,
    required this.text,
  });

  final String text;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: kColor.redColor,
            elevation: 0),
        onPressed: () {
          function;
        },
        child: Text(
          text,
          style: appStyle(
              fw: FontWeight.w500, size: 14.sp, color: kColor.whiteColor),
        ),
      ),
    );
  }
}
