import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({
    super.key,
    required this.function,
    required this.title,
    required this.subtitle,
  });
  final void Function() function;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 17.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 11.sp,
                      color: kColor.text2Color),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: kColor.text2Color,
            )
          ],
        ),
      ),
    );
  }
}
