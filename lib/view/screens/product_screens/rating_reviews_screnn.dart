import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screens/product_screen.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/add_review_widget.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/ratingNo_showPhoto.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/rating_row_widget.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/reviews_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RatingAndReviewsScreen extends StatefulWidget {
  const RatingAndReviewsScreen({super.key, required this.product});
  final Product product;
  @override
  State<RatingAndReviewsScreen> createState() => _RatingAndReviewsScreenState();
}

class _RatingAndReviewsScreenState extends State<RatingAndReviewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductReviews(widget.product.id!);
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductRating(widget.product.id!);
  }

  final reviewController = TextEditingController();
  double rate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(product: widget.product)))
                  .then((value) => setState);
            },
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
            ReviewsNoAndshowPhotoWidget(
              widget: widget,
              productId: widget.product.id!,
            ),
            SizedBox(height: 30.h),
            ReviewsList(
                id: widget.product.id!,
                rate: Provider.of<ReviewProvider>(context, listen: true).rating,
                reviews:
                    Provider.of<ReviewProvider>(context, listen: true).reviews),
            SizedBox(height: 30.h),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150.w,
        height: 36.h,
        child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: kColor.redColor,
            onPressed: () {
              addReview(context, widget.product, reviewController);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.edit, color: kColor.whiteColor),
                SizedBox(width: 4.w),
                Text(
                  "Write a review",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 11.sp,
                      color: kColor.whiteColor),
                )
              ],
            )),
      ),
    );
  }
}
