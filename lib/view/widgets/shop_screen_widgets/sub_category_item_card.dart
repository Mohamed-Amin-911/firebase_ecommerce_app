import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItemCard extends StatelessWidget {
  const SubCategoryItemCard({
    super.key,
    required this.name,
    required this.function,
  });
  final String name;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
      child: TextButton(
        onPressed: function,
        child: Text(name,
            style: appStyle(
                fw: FontWeight.w500, size: 14, color: kColor.textColor)),
      ),
    );
  }
}
