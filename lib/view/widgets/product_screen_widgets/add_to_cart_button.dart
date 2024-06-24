import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.function,
  });
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 343.w,
        height: 48.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: kColor.redColor,
              elevation: 0),
          onPressed: function,
          child: Text(
            "ADD TO CART",
            style: appStyle(
                fw: FontWeight.w500, size: 14.sp, color: kColor.whiteColor),
          ),
        ),
      ),
    );
  }
}
