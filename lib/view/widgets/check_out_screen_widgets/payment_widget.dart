import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/bag_screens/change_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
    required this.cards,
    required this.defaultCard,
  });

  final List<Map<String, dynamic>> cards;
  final Map<String, dynamic> defaultCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment',
          style: appStyle(
              fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
        ),
        SizedBox(height: 21.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cards.isEmpty
                ? Row(
                    children: [
                      Text(
                        'No Payment',
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.textColor),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChangeCardScreen(),
                              ));
                        },
                        child: Text(
                          'Add',
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 14.sp,
                              color: kColor.redColor),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            defaultCard["cardNumber"][0] == "5" ||
                                    defaultCard["cardNumber"][0] == "2"
                                ? KImageAssets.mastercard
                                : KImageAssets.visa,
                            height: 35.h,
                            width: 42.w,
                          ),
                          SizedBox(width: 17.w),
                          Text(
                            '**** **** **** ${defaultCard["cardNumber"].substring(defaultCard["cardNumber"].length - 4)}',
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.textColor),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangeCardScreen(),
                                  ));
                            },
                            child: Text(
                              'Change',
                              style: appStyle(
                                  fw: FontWeight.w500,
                                  size: 14.sp,
                                  color: kColor.redColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ],
    );
  }
}
