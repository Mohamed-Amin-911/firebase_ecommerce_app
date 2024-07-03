import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screens/rating_reviews_screnn.dart';

import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

addReview(BuildContext context, Product product,
    TextEditingController reviewController) {
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
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rate_rounded,
                        color: kColor.ratingColor,
                      ),
                      onRatingUpdate: (rating) {
                        Provider.of<ReviewProvider>(context, listen: false)
                            .addProductRate(product.id!, rating);
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
                        contentPadding:
                            EdgeInsets.only(top: 7.h, left: 20.w, bottom: 10.h),
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
                                  product.id!, reviewController.text);
                          reviewController.clear();
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RatingAndReviewsScreen(
                                      product:
                                          product))).then((value) => setState);
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
