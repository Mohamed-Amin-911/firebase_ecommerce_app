import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextField2Widget extends StatelessWidget {
  const TextField2Widget({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.h,
      width: 327.w,
      child: TextFormField(
        maxLines: 10,
        controller: controller,
        cursorColor: kColor.textColor,
        cursorWidth: 1,
        obscureText: false,
        keyboardType: TextInputType.text,
        style: TextStyle(
            height: 1.5,
            fontFamily: "Metropolis",
            fontSize: 14.sp,
            color: kColor.textColor,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelStyle: TextStyle(
              fontFamily: "Metropolis",
              fontSize: 14.sp,
              color: kColor.text2Color,
              fontWeight: FontWeight.w500),
          labelStyle: TextStyle(
            fontFamily: "Metropolis",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: kColor.text2Color,
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: kColor.whiteColor,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kColor.whiteColor)),
          contentPadding: EdgeInsets.only(top: 7.h, left: 20.w, bottom: 10.h),
          border: const OutlinedInputBorder(),
        ),
      ),
    );
  }
}
