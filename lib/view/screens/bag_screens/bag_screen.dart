import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/controller/provider/promoCode_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/bag_screens/check_out_screen.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/add_promo_code_screen.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final promoController = TextEditingController();

  int quantity = 1;

  @override
  void initState() {
    Provider.of<PromoCodePRovider>(context, listen: false).setDiscount(0);
    Provider.of<PromoCodePRovider>(context, listen: false).setPromoCode("");
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<CartProvider>(context, listen: false).fetchCart(
      Provider.of<RetrieveProductProvider>(context, listen: false).products,
    );
    Provider.of<CartProvider>(context, listen: false).getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems =
        Provider.of<CartProvider>(context, listen: true).items;
    double totalAmount =
        Provider.of<CartProvider>(context, listen: true).getTotalPrice();
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
                          SizedBox(height: 120.h),
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
              onTap: () {
                promoCode(context, promoController);
              },
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Text(
                    Provider.of<PromoCodePRovider>(context, listen: true)
                                .promoCodeTxt ==
                            ""
                        ? "Enter your promo code"
                        : Provider.of<PromoCodePRovider>(context, listen: true)
                            .promoCodeTxt,
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
                  "${((totalAmount.toInt()) - (totalAmount.toInt() * (Provider.of<PromoCodePRovider>(context, listen: true).discount / 100))).toInt()}\$",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 18.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            //checkout button
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
                    cartItems.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("cart is empty")),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(
                                totalPrice: (totalAmount.toInt()) -
                                    (totalAmount.toInt() *
                                        (Provider.of<PromoCodePRovider>(context,
                                                    listen: true)
                                                .discount /
                                            100)),
                              ),
                            ));
                  },
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
}
