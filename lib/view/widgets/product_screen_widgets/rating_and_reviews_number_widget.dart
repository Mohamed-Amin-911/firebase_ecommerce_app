import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/rating_reviews_screnn.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RatingAndReviewsNoWidget extends StatefulWidget {
  const RatingAndReviewsNoWidget({
    super.key,
    required this.product,
    required this.reviews,
    required this.rating,
  });
  final double rating;
  final Product product;
  final List<String> reviews;

  @override
  State<RatingAndReviewsNoWidget> createState() =>
      _RatingAndReviewsNoWidgetState();
}

class _RatingAndReviewsNoWidgetState extends State<RatingAndReviewsNoWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductReviews(widget.product.id!);
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductRating(widget.product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RatingAndReviewsScreen(product: widget.product),
              ));
        },
        child: Row(
          children: [
            RatingBar.builder(
              initialRating:
                  Provider.of<ReviewProvider>(context, listen: true).rating,
              minRating: widget.rating,
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
              "(${Provider.of<ReviewProvider>(context, listen: true).reviews.toString() == "[]" ? 0 : Provider.of<ReviewProvider>(context, listen: true).reviews.length})",
              style: appStyle(
                  fw: FontWeight.w400, size: 12.sp, color: kColor.text2Color),
            ),
          ],
        ),
      ),
    );
  }
}
