import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.isFavourited,
    required this.rating,
    required this.reviews,
    required this.name,
    required this.price,
    required this.store,
  });
  final String image;
  final bool isFavourited;
  final double rating;
  final int reviews;
  final String name;
  final String store;
  final String price;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: 164.w,
            height: 290.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image,
                    width: 162.w,
                    height: 184.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
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
                      " ($reviews)",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 15.sp,
                          color: kColor.text2Color),
                    ),
                  ],
                ),
                Text(
                  store,
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 15.sp,
                      color: kColor.text2Color),
                ),
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: appStyle(
                          fw: FontWeight.w600,
                          size: 16.sp,
                          color: kColor.textColor)
                      .copyWith(
                    height: 1,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "$price\$",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.w,
            top: 150.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColor.whiteColor,
                  shape: const CircleBorder(),
                  padding: REdgeInsets.all(10),
                  elevation: 4),
              onPressed: () {},
              child: isFavourited
                  ? const Center(
                      child: Icon(
                        Icons.favorite_rounded,
                        color: kColor.redColor,
                      ),
                    )
                  : const Center(
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: kColor.text2Color,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
