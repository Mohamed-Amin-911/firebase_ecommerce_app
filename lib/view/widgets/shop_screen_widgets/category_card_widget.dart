import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.name,
    required this.image,
    this.onPressed,
  });
  final String name;
  final String image;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 343.w,
        height: 100.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SizedBox(width: 39.w),
            Text(name,
                style: appStyle(
                    fw: FontWeight.w600, size: 18, color: kColor.textColor)),
            const Spacer(),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              child: Image.asset(
                image,
                width: 171.w,
                height: 100,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
