import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class RedButtonWidget extends StatelessWidget {
  const RedButtonWidget({
    super.key,
    required this.name,
    required this.function,
  });
  final String name;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 343.w,
        height: 48.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColor.redColor, elevation: 0),
          onPressed: function,
          child: Text(
            name,
            style: appStyle(
                fw: FontWeight.w500, size: 14.sp, color: kColor.whiteColor),
          ),
        ),
      ),
    );
  }
}
