import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteCardItems extends StatelessWidget {
  const FavouriteCardItems({
    super.key,
    required this.pp,
    required this.index,
  });
  final int index;
  final List<Product> pp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kColor.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: kColor.text2Color.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
                blurStyle: BlurStyle.outer)
          ]),
      margin: EdgeInsets.only(bottom: 28.h),
      // padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.network(
              pp[index].image,
              width: 104.w,
              // height: 104.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              //store
              Text(
                pp[index].store,
                style: appStyle(
                    fw: FontWeight.w400, size: 13.sp, color: kColor.text2Color),
              ),
              SizedBox(height: 2.h),
              //name
              SizedBox(
                width: 140.w,
                child: Text(
                  pp[index].name,
                  maxLines: 3,
                  style: appStyle(
                          fw: FontWeight.w600,
                          size: 18.sp,
                          color: kColor.textColor)
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(height: 15.h),
              //price
              Text(
                "${pp[index].price} \$",
                style: appStyle(
                    fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
              ),
              SizedBox(height: 7.h),
              //rating
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: pp[index].rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 20,
                    maxRating: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rate_rounded,
                      color: kColor.ratingColor,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  Text(
                    "(${pp[index].reviews[0].substring(1, pp[index].reviews[0].length - 1) == "" ? 0 : pp[index].reviews.length})",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 15.sp,
                        color: kColor.text2Color),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
