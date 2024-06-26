import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/rating_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndReviewsScreen extends StatefulWidget {
  const RatingAndReviewsScreen({super.key, required this.product});
  final Product product;
  @override
  State<RatingAndReviewsScreen> createState() => _RatingAndReviewsScreenState();
}

class _RatingAndReviewsScreenState extends State<RatingAndReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColor.textColor,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            Text(
              "Rating&Reviews",
              style: appStyle(
                  fw: FontWeight.w600, size: 34.sp, color: kColor.textColor),
            ),
            SizedBox(height: 41.h),
            RatingRowWidget(widget: widget),
            SizedBox(height: 33.h),
            Row(
              children: [
                Text(
                  "${widget.product.reviews[0].substring(1, widget.product.reviews[0].length - 1) == "" ? 0 : widget.product.reviews.length}",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 24.sp,
                      color: kColor.textColor),
                ),
                Text(
                  " reviews",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 24.sp,
                      color: kColor.textColor),
                ),
                SizedBox(width: 100.w),
                Checkbox(
                  value: false,
                  onChanged: (fal) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: const BorderSide(color: kColor.text2Color)),
                ),
                SizedBox(width: 1.w),
                Text(
                  "with photo",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.product.reviews[0]
                          .substring(1, widget.product.reviews[0].length - 1) ==
                      ""
                  ? 0
                  : widget.product.reviews.length,
              itemBuilder: (context, index) {
                return ReviewCard(
                  review: widget.product.reviews[index],
                  rating: widget.product.rating,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
    required this.rating,
  });
  final double rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50.w, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                  width: 32.w,
                  height: 32.w,
                  fit: BoxFit.cover,
                  KImageAssets.userImage)),
          Padding(
            padding: EdgeInsets.only(left: 56.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Helene Moore",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
                SizedBox(height: 5.h),
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
                    const Spacer(),
                    Text(
                      "June 5, 2019",
                      style: appStyle(
                              fw: FontWeight.w500,
                              size: 11.sp,
                              color: kColor.text2Color)
                          .copyWith(height: 1.3),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  review,
                  style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.text2Color)
                      .copyWith(height: 1.3),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
