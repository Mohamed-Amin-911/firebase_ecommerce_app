import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screen.dart';
import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/ratingNo_showPhoto.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/rating_row_widget.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/reviews_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              addReview(context);
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
//======================================================================================================

  addReview(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: kColor.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
      elevation: 10,
      enableDrag: true,
      barrierColor: const Color.fromARGB(94, 78, 78, 78),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return BottomSheet(
            enableDrag: true,
            onClosing: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
            builder: (BuildContext context) {
              return Container(
                height: 540.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 13.h),
                    Center(
                      child: Container(
                        height: 6.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: kColor.text2Color,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: Text(
                        "What is you rate?",
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 18.sp,
                            color: kColor.textColor),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        ignoreGestures: false,
                        itemCount: 5,
                        itemSize: 60,
                        maxRating: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: kColor.ratingColor,
                        ),
                        onRatingUpdate: (rating) {
                          Provider.of<ReviewProvider>(context, listen: false)
                              .addProductRate(widget.product.id!, rating);
                        },
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Center(
                      child: SizedBox(
                        width: 240.w,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Please share your opinion about the product",
                          style: appStyle(
                              fw: FontWeight.w600,
                              size: 18.sp,
                              color: kColor.textColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 148.h,
                      width: 327.w,
                      child: TextFormField(
                        maxLines: 10,
                        controller: reviewController,
                        cursorColor: kColor.textColor,
                        cursorWidth: 1,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: "Metropolis",
                            fontSize: 14.sp,
                            color: kColor.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          labelText: "Your review",
                          floatingLabelStyle: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 14.sp,
                              color: kColor.text2Color,
                              fontWeight: FontWeight.w500),
                          labelStyle: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kColor.text2Color,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kColor.whiteColor,
                          )),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: kColor.whiteColor)),
                          contentPadding: EdgeInsets.only(
                              top: 7.h, left: 20.w, bottom: 10.h),
                          border: const OutlinedInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    Container(
                      margin: EdgeInsets.only(left: 41.w),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kColor.redColor),
                      child: const Icon(
                        Icons.camera_alt,
                        color: kColor.whiteColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 21.w),
                      child: Text(
                        "Add your photos",
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 11.sp,
                            color: kColor.textColor),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child: SizedBox(
                        width: 343.w,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              backgroundColor: kColor.redColor,
                              elevation: 0),
                          onPressed: () {
                            Provider.of<ReviewProvider>(context, listen: false)
                                .addProductReview(
                                    widget.product.id!, reviewController.text);
                            reviewController.clear();
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RatingAndReviewsScreen(
                                                product: widget.product)))
                                .then((value) => setState);
                          },
                          child: Text(
                            "SEND REVIEW",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
      },
    );
  }
}
