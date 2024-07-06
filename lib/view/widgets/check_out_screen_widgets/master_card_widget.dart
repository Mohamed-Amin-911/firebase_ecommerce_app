import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/credit_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MasterCard extends StatelessWidget {
  const MasterCard({
    super.key,
    required this.defaultCard,
    required this.indexx,
    required this.function,
  });

  final Map<String, dynamic> defaultCard;
  final int indexx;
  final void Function(bool?) function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 344.w,
              height: 216.h,
              decoration: BoxDecoration(
                  color: kColor.textColor,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Positioned(
              left: 190.w,
              bottom: 66.h,
              child: Image.asset(KImageAssets.ellipse),
            ),
            Positioned(
              left: 0.w,
              bottom: 0.h,
              child: Image.asset(KImageAssets.vector),
            ),
            Positioned(
              left: 24.w,
              top: 34.h,
              child: Image.asset(KImageAssets.chip),
            ),
            Positioned(
              right: 24.w,
              bottom: 19.h,
              child: Image.asset(
                  width: 52.w, height: 35.h, KImageAssets.mastercard2),
            ),
            Positioned(
              left: 24.w,
              top: 87.h,
              child: Text(
                '**** **** **** ${defaultCard["cardNumber"].substring(defaultCard["cardNumber"].length - 4)}',
                style: appStyle(
                        fw: FontWeight.w400,
                        size: 24.sp,
                        color: kColor.whiteColor)
                    .copyWith(letterSpacing: 2),
              ),
            ),
            Positioned(
              left: 24.w,
              bottom: 23.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Holder Name',
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 10.sp,
                          color: kColor.whiteColor)),
                  SizedBox(height: 3.h),
                  Text('${defaultCard["name"]}',
                      style: appStyle(
                          fw: FontWeight.w600,
                          size: 14.sp,
                          color: kColor.whiteColor)),
                ],
              ),
            ),
            Positioned(
              left: 169.w,
              bottom: 23.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expiry Date',
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 10.sp,
                          color: kColor.whiteColor)),
                  SizedBox(height: 3.h),
                  Text('${defaultCard["expireDate"]}',
                      style: appStyle(
                          fw: FontWeight.w600,
                          size: 14.sp,
                          color: kColor.whiteColor)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Checkbox(
              activeColor: kColor.textColor,
              side: const BorderSide(color: kColor.text2Color, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              value: indexx ==
                      Provider.of<CreditCardProvider>(context, listen: true)
                          .selectedIndex
                  ? true
                  : false,
              onChanged: function,
            ),
            Text(
              'Use as default payment method',
              style: appStyle(
                  fw: FontWeight.w300, size: 12.sp, color: kColor.textColor),
            ),
          ],
        ),
        SizedBox(height: 39.h)
      ],
    );
  }
}
