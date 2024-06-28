import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/view/screens/rating_reviews_screnn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReviewsNoAndshowPhotoWidget extends StatefulWidget {
  const ReviewsNoAndshowPhotoWidget({
    super.key,
    required this.widget,
    required this.productId,
  });
  final String productId;
  final RatingAndReviewsScreen widget;

  @override
  State<ReviewsNoAndshowPhotoWidget> createState() =>
      _ReviewsNoAndshowPhotoWidgetState();
}

class _ReviewsNoAndshowPhotoWidgetState
    extends State<ReviewsNoAndshowPhotoWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductReviews(widget.productId);
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductRating(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${Provider.of<ReviewProvider>(context, listen: true).reviews.isEmpty ? 0 : widget.widget.product.reviews.length}",
          style: appStyle(
              fw: FontWeight.w600, size: 24.sp, color: kColor.textColor),
        ),
        Text(
          " reviews",
          style: appStyle(
              fw: FontWeight.w600, size: 24.sp, color: kColor.textColor),
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
              fw: FontWeight.w500, size: 14.sp, color: kColor.textColor),
        ),
      ],
    );
  }
}
