import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class TxtFieldWidget extends StatelessWidget {
  const TxtFieldWidget({
    super.key,
    required this.label,
    required this.obscureText,
    required this.keyboardType,
    required this.validator,
    required this.error,
    required this.isFieldEmpty,
    required this.controller,
  });
  final TextEditingController controller;
  final bool error;
  final bool isFieldEmpty;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 70.h,
        width: 343.w,
        child: TextFormField(
          controller: controller,
          cursorColor: kColor.textColor, cursorWidth: 1,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
              fontFamily: "Metropolis",
              fontSize: 14.sp,
              color: kColor.textColor,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            suffixIcon: !error
                ? Icon(Icons.check,
                    color: isFieldEmpty ? kColor.whiteColor : kColor.greenColor)
                : const Icon(Icons.close, color: kColor.redColor),
            labelText: label,
            errorBorder: const OutlinedInputBorder(
                borderSide: BorderSide(color: kColor.redColor)),
            floatingLabelStyle: TextStyle(
                fontFamily: "Metropolis",
                fontSize: 14.sp,
                color: !error ? kColor.text2Color : kColor.redColor,
                fontWeight: FontWeight.w500),
            errorStyle: TextStyle(
                fontFamily: "Metropolis",
                fontSize: 11.sp,
                color: kColor.redColor,
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

          // onSaved: (value) => _username = value!,
        ),
      ),
    );
  }
}
