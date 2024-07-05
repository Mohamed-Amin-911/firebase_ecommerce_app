import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/bag_screens/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliverAndTotalAmountWidget extends StatelessWidget {
  const DeliverAndTotalAmountWidget({
    super.key,
    required this.widget,
  });

  final CheckOutScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //delivery
        Text(
          'Delivery method',
          style: appStyle(
              fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
        ),
        SizedBox(height: 21.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(KImageAssets.fedex),
                  SizedBox(height: 11.h),
                  Text(
                    ' 2-3 days',
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 12.sp,
                        color: kColor.text2Color),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(KImageAssets.usps),
                  SizedBox(height: 11.h),
                  Text(
                    ' 2-3 days',
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 12.sp,
                        color: kColor.text2Color),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(KImageAssets.dhl),
                  SizedBox(height: 11.h),
                  Text(
                    ' 2-3 days',
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 12.sp,
                        color: kColor.text2Color),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 52.h),
        //total amount
        Row(
          children: [
            Text(
              'Order:',
              style: appStyle(
                  fw: FontWeight.w500, size: 14.sp, color: kColor.text2Color),
            ),
            const Spacer(),
            Text(
              '${widget.totalPrice.toInt()}\$',
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
          ],
        ),
        SizedBox(height: 17.h),
        Row(
          children: [
            Text(
              'Delivery:',
              style: appStyle(
                  fw: FontWeight.w500, size: 14.sp, color: kColor.text2Color),
            ),
            const Spacer(),
            Text(
              '15\$',
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
          ],
        ),
        SizedBox(height: 17.h),
        Row(
          children: [
            Text(
              'Summary:',
              style: appStyle(
                  fw: FontWeight.w600, size: 14.sp, color: kColor.text2Color),
            ),
            const Spacer(),
            Text(
              '${widget.totalPrice.toInt() + 15}\$',
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
          ],
        ),
      ],
    );
  }
}
