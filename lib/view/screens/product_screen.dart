import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/favourites_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/favourite_screen_widget/add_To_cart_And_dummy_widgets.dart';
import 'package:ecommerce_app/view/widgets/favourite_screen_widget/description.dart';
import 'package:ecommerce_app/view/widgets/product_screen_widgets/name_and_price_widget.dart';
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
          child: Expanded(
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

                    SizedBox(width: 30.w),

                    //favourite
                    FutureBuilder(
                        future: Provider.of<FavoritesProvider>(context,
                                listen: false)
                            .isFavorite(widget.product.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kColor.whiteColor,
                                  shape: const CircleBorder(),
                                  padding: REdgeInsets.all(10),
                                  elevation: 4),
                              onPressed: () {
                                if (snapshot.data == true) {
                                  Provider.of<FavoritesProvider>(context,
                                          listen: false)
                                      .removeFavorites(product.id!);
                                } else if (snapshot.data == false) {
                                  Provider.of<FavoritesProvider>(context,
                                          listen: false)
                                      .addToFavorites(product.id!);
                                }
                                setState(() {});
                              },
                              child: snapshot.data!
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
                            );
                          } else {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kColor.whiteColor,
                                  shape: const CircleBorder(),
                                  padding: REdgeInsets.all(10),
                                  elevation: 4),
                              onPressed: () {},
                              child: Provider.of<FavoritesProvider>(context,
                                          listen: true)
                                      .isFavourited
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
                            );
                          }
                        }),
                  ],
                ),

                SizedBox(height: 22.h),
                //name and price
                NameAndPriceWidget(product: product),

                SizedBox(height: 8.h),
                //rating and reviews number
                RatingAndReviewsNoWidget(
                    product: widget.product,
                    rating: Provider.of<ReviewProvider>(context, listen: true)
                        .rating,
                    reviews: Provider.of<ReviewProvider>(context, listen: true)
                        .reviews),

                //description
                DescriptionWidget(product: product),

                //add to cart and dummy widgets
                AddToCartAndDummyWidget(
                    selectedColor: selectedColor,
                    selectedSize: selectedSize,
                    widget: widget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
