import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';

import 'package:ecommerce_app/model/promocode_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({
    super.key,
    required this.promocode,
    required this.function,
  });
  final void Function() function;
  final PromoCode promocode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        padding: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                  color: kColor.text2Color.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.outer)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  child: Image.asset(
                    promocode.image,
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 10.w,
                  top: 23.h,
                  bottom: 23.h,
                  right: 10.w,
                  child: Row(
                    children: [
                      Text(
                        "${promocode.discount.toInt()}",
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 34.sp,
                            color: promocode.textColor),
                      ),
                      Text(
                        "%\noff",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: promocode.textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            // SizedBox(width: 14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promocode.title,
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
                SizedBox(height: 4.h),
                Text(
                  promocode.code,
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 12.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${promocode.remainingDays} days remaining",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 13.sp,
                      color: kColor.text2Color),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 36.h,
                  width: 93.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kColor.redColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      onPressed: function,
                      child: Text(
                        "Apply",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.whiteColor),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
