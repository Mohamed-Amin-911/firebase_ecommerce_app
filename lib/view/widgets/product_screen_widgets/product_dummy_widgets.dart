import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/widgets/home_screen_widgets/new_item_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDummyWidgets extends StatelessWidget {
  const ProductDummyWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 134.w,
            height: 5.h,
            decoration: BoxDecoration(
                color: kColor.textColor,
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
        SizedBox(height: 38.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping info",
              style: appStyle(
                  fw: FontWeight.w500, size: 16.sp, color: kColor.textColor),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kColor.textColor,
                ))
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Support",
              style: appStyle(
                  fw: FontWeight.w500, size: 16.sp, color: kColor.textColor),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kColor.textColor,
                ))
          ],
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "You can also like this",
              style: appStyle(
                  fw: FontWeight.w600, size: 20.sp, color: kColor.textColor),
            ),
            Text(
              "3 items",
              style: appStyle(
                  fw: FontWeight.w500, size: 12.sp, color: kColor.text2Color),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              NewItemCard(
                image: KImageAssets.main2,
              ),
              NewItemCard(
                image: KImageAssets.main3,
              ),
              NewItemCard(
                image: KImageAssets.main2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
