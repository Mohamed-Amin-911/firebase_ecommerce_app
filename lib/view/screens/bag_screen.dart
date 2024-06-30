import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  int quantity = 1;
  double totalAmount = 0;
  @override
  void initState() {
    // Provider.of<CartProvider>(context, listen: false).clearProducts();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<CartProvider>(context, listen: false).fetchCart(
      Provider.of<RetrieveProductProvider>(context, listen: false).products,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cartItems =
        Provider.of<CartProvider>(context, listen: true).items;
    totalAmount = Provider.of<CartProvider>(context, listen: true).totalPrice;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: kColor.textColor,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text("My Bag",
                style: appStyle(
                    fw: FontWeight.w600, size: 34.sp, color: kColor.textColor)),
            SizedBox(height: 18.h),
            Provider.of<RetrieveProductProvider>(context, listen: true)
                    .isLoading
                ?
                //if data is loading
                Center(
                    child: SizedBox(
                      height: 310.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 160.h),
                          const Center(
                            child: CircularProgressIndicator(
                              color: kColor.textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : cartItems.isEmpty
                    ?
                    //if list is empty
                    Center(
                        child: SizedBox(
                          height: 310.h,
                          child: Column(
                            children: [
                              SizedBox(height: 160.h),
                              Text("No items in your bag",
                                  style: appStyle(
                                      fw: FontWeight.w400,
                                      size: 20.sp,
                                      color: kColor.textColor)),
                            ],
                          ),
                        ),
                      )
                    :
                    //listview
                    SizedBox(
                        height: 310.h,
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              return cartItemCard(
                                  Provider.of<RetrieveProductProvider>(context,
                                          listen: true)
                                      .products
                                      .firstWhere((product) =>
                                          product.id == cartItems[index]["id"]),
                                  cartItems[index],
                                  context,
                                  products);
                            },
                          ),
                        ),
                      ),
            SizedBox(height: 15.h),

            //promo code
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Text(
                    "Enter your promo code",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.text2Color),
                  ),
                  const Spacer(),
                  Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: const BoxDecoration(
                          color: kColor.textColor, shape: BoxShape.circle),
                      child: const Center(
                          child: Icon(Icons.arrow_forward,
                              color: kColor.whiteColor)))
                ],
              ),
            ),
            SizedBox(height: 15.h),

            //total amount
            Row(
              children: [
                Text(
                  "Total amount:",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.text2Color),
                ),
                const Spacer(),
                Text(
                  "${totalAmount.toInt()}\$",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 18.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            SizedBox(height: 15.h),
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
                  onPressed: () {},
                  child: Text(
                    "CHECK OUT",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.whiteColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//  addReview(BuildContext context) {
//     return showModalBottomSheet(
//       useRootNavigator: true,
//       isScrollControlled: true,
//       backgroundColor: kColor.whiteColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
//       elevation: 10,
//       enableDrag: true,
//       barrierColor: const Color.fromARGB(94, 78, 78, 78),
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(builder: (BuildContext context, setState) {
//           return BottomSheet(
//             enableDrag: true,
//             onClosing: () {},
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
//             builder: (BuildContext context) {
//               return Container(
//                 height: 540.h,
//                 width: double.infinity.w,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(34),
//                         topRight: Radius.circular(34))),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 13.h),
//                     Center(
//                       child: Container(
//                         height: 6.h,
//                         width: 60.w,
//                         decoration: BoxDecoration(
//                             color: kColor.text2Color,
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     Center(
//                       child: Text(
//                         "What is you rate?",
//                         style: appStyle(
//                             fw: FontWeight.w600,
//                             size: 18.sp,
//                             color: kColor.textColor),
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     Center(
//                       child: RatingBar.builder(
//                         initialRating: 0,
//                         minRating: 0,
//                         direction: Axis.horizontal,
//                         ignoreGestures: false,
//                         itemCount: 5,
//                         itemSize: 60,
//                         maxRating: 5,
//                         itemPadding:
//                             const EdgeInsets.symmetric(horizontal: 0.0),
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star_rate_rounded,
//                           color: kColor.ratingColor,
//                         ),
//                         onRatingUpdate: (rating) {
//                           Provider.of<ReviewProvider>(context, listen: false)
//                               .addProductRate(widget.product.id!, rating);
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 28.h),
//                     Center(
//                       child: SizedBox(
//                         width: 240.w,
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           "Please share your opinion about the product",
//                           style: appStyle(
//                               fw: FontWeight.w600,
//                               size: 18.sp,
//                               color: kColor.textColor),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     SizedBox(
//                       height: 148.h,
//                       width: 327.w,
//                       child: TextFormField(
//                         maxLines: 10,
//                         controller: reviewController,
//                         cursorColor: kColor.textColor,
//                         cursorWidth: 1,
//                         obscureText: false,
//                         keyboardType: TextInputType.text,
//                         style: TextStyle(
//                             height: 1.5,
//                             fontFamily: "Metropolis",
//                             fontSize: 14.sp,
//                             color: kColor.textColor,
//                             fontWeight: FontWeight.w500),
//                         decoration: InputDecoration(
//                           labelText: "Your review",
//                           floatingLabelStyle: TextStyle(
//                               fontFamily: "Metropolis",
//                               fontSize: 14.sp,
//                               color: kColor.text2Color,
//                               fontWeight: FontWeight.w500),
//                           labelStyle: TextStyle(
//                             fontFamily: "Metropolis",
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w500,
//                             color: kColor.text2Color,
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                             color: kColor.whiteColor,
//                           )),
//                           enabledBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: kColor.whiteColor)),
//                           contentPadding: EdgeInsets.only(
//                               top: 7.h, left: 20.w, bottom: 10.h),
//                           border: const OutlinedInputBorder(),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 36.h),
//                     Container(
//                       margin: EdgeInsets.only(left: 41.w),
//                       padding: const EdgeInsets.all(10),
//                       decoration: const BoxDecoration(
//                           shape: BoxShape.circle, color: kColor.redColor),
//                       child: const Icon(
//                         Icons.camera_alt,
//                         color: kColor.whiteColor,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     Padding(
//                       padding: EdgeInsets.only(left: 21.w),
//                       child: Text(
//                         "Add your photos",
//                         style: appStyle(
//                             fw: FontWeight.w600,
//                             size: 11.sp,
//                             color: kColor.textColor),
//                       ),
//                     ),
//                     SizedBox(height: 40.h),
//                     Center(
//                       child: SizedBox(
//                         width: 343.w,
//                         height: 48.h,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25)),
//                               backgroundColor: kColor.redColor,
//                               elevation: 0),
//                           onPressed: () {
//                             Provider.of<ReviewProvider>(context, listen: false)
//                                 .addProductReview(
//                                     widget.product.id!, reviewController.text);
//                             reviewController.clear();
//                             Navigator.pop(context);
//                             Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             RatingAndReviewsScreen(
//                                                 product: widget.product)))
//                                 .then((value) => setState);
//                           },
//                           child: Text(
//                             "SEND REVIEW",
//                             style: appStyle(
//                                 fw: FontWeight.w500,
//                                 size: 14.sp,
//                                 color: kColor.whiteColor),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         });
//       },
//     );
//   }
}
