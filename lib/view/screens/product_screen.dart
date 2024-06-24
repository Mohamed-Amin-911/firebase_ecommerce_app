import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/product_screen_widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/view/widgets/product_screen_widgets/name_and_price_widget.dart';
import 'package:ecommerce_app/view/widgets/product_screen_widgets/product_dummy_widgets.dart';
import 'package:ecommerce_app/view/widgets/product_screen_widgets/rating_and_reviews_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final valueListenable = ValueNotifier<String?>(null);
  bool isFavourited = false;
  @override
  Widget build(BuildContext context) {
    String selectedSize =
        Provider.of<RetrieveProductProvider>(context, listen: true)
            .selectedSize;

    String selectedColor =
        Provider.of<RetrieveProductProvider>(context, listen: true)
            .sellectedColor;
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 10,
        leading: IconButton(
            onPressed: () {
              Provider.of<RetrieveProductProvider>(context, listen: false)
                  .setSellectedColor(" ");
              Provider.of<RetrieveProductProvider>(context, listen: false)
                  .setSelectedSize(" ");
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColor.textColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: kColor.textColor,
              ))
        ],
        centerTitle: true,
        title: Text(
          product.name,
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Image.network(
                fit: BoxFit.cover,
                product.image,
                width: 375.w,
                height: 413.h,
              ),

              SizedBox(height: 12.h),
              //size, color and favourite
              Row(
                children: [
                  //size
                  Container(
                    width: 110.w,
                    margin: EdgeInsets.only(left: 16.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kColor.redColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Size",
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                        ),
                        DropdownButton<String>(
                          alignment: AlignmentDirectional.bottomCenter,
                          value: selectedSize,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: kColor.textColor,
                          ),
                          iconSize: 24.0,
                          elevation: 16,
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                          onChanged: (newValue) {
                            setState(() {
                              selectedSize = newValue!;
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .setSelectedSize(
                                      newValue); // Call callback with selected size
                            });
                          },
                          items: product.sizes
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<String>>((String size) {
                            return DropdownMenuItem<String>(
                              value: size,
                              child: Text(size),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  //color
                  Container(
                    width: 110.w,
                    margin: EdgeInsets.only(left: 16.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kColor.textColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Color",
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                        ),
                        DropdownButton<String>(
                          alignment: AlignmentDirectional.topStart,
                          value: selectedColor,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: kColor.textColor,
                          ),
                          iconSize: 24.0,
                          elevation: 16,
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                          onChanged: (newValue) {
                            setState(() {
                              selectedColor = newValue!;
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .setSellectedColor(
                                      newValue); // Call callback with selected size
                            });
                          },
                          items: product.colors
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<String>>((String color) {
                            return DropdownMenuItem<String>(
                              value: color,
                              child: color == " "
                                  ? Container()
                                  : Container(
                                      width: 20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kColor.text2Color),
                                          shape: BoxShape.circle,
                                          color: Color(int.parse(color))),
                                    ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  //favourite
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kColor.whiteColor,
                        shape: const CircleBorder(),
                        padding: REdgeInsets.all(10),
                        elevation: 4),
                    onPressed: () {
                      setState(() {
                        isFavourited = !isFavourited;
                      });
                    },
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
                ],
              ),

              SizedBox(height: 22.h),
              //name and price
              NameAndPriceWidget(product: product),

              SizedBox(height: 8.h),
              //ratign and reviews number
              RatingAndReviewsNoWidget(product: product),

              //description
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  product.description,
                  style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.textColor)
                      .copyWith(height: 1.1.h),
                ),
              ),

              //add to cart and dummy widgets
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                decoration:
                    const BoxDecoration(color: kColor.whiteColor, boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 8,
                      color: Color.fromARGB(127, 155, 155, 155),
                      offset: Offset(0, 2))
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddToCartButton(function: () {}),
                    SizedBox(height: 30.h),
                    const ProductDummyWidgets(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
