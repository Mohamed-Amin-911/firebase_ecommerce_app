import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/widgets/home_screen_widgets/new_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class NewItemsWidget extends StatelessWidget {
  const NewItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "New",
                style: appStyle(
                    fw: FontWeight.w800, size: 34.sp, color: kColor.textColor),
              ),
              SizedBox(width: 200.w),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: appStyle(
                      fw: FontWeight.w200,
                      size: 11.sp,
                      color: kColor.textColor),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Text(
            "You’ve never seen it before!",
            style: appStyle(
                fw: FontWeight.w200, size: 11.sp, color: kColor.textColor),
          ),
        ),
        SizedBox(height: 22.h),
        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: const SingleChildScrollView(
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
        ),
      ],
    );
  }
}
