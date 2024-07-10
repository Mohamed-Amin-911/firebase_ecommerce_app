import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_user_info_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.review,
    required this.rating,
  });
  final double rating;
  final String review;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  void initState() {
    super.initState();

    Provider.of<RetrieveUserProvider>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final Userr user =
        Provider.of<RetrieveUserProvider>(context, listen: true).user;
    return Container(
      margin: EdgeInsets.only(right: 50.w, bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                  width: 32.w,
                  height: 32.w,
                  fit: BoxFit.cover,
                  user.image == null
                      ? KImageAssets.user
                      : KImageAssets.userImage)),
          Padding(
            padding: EdgeInsets.only(left: 56.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: widget.rating,
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
                  widget.review,
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
