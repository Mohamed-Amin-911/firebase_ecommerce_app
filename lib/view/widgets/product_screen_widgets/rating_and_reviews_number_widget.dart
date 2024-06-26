import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/rating_reviews_screnn.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndReviewsNoWidget extends StatelessWidget {
  const RatingAndReviewsNoWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RatingAndReviewsScreen(product: product),
              ));
        },
        child: Row(
          children: [
            RatingBar.builder(
              initialRating: product.rating,
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
            SizedBox(width: 2.w),
            Text(
              "(${product.reviews[0].substring(1, product.reviews[0].length - 1) == "" ? 0 : product.reviews.length})",
              style: appStyle(
                  fw: FontWeight.w400, size: 12.sp, color: kColor.text2Color),
            ),
          ],
        ),
      ),
    );
  }
}
