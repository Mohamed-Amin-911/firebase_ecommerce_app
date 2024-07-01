import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/controller/provider/promoCode_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/promocode_model.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/cart_item_card.dart';
import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
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
  double totalAmount = 0;
  @override
  void initState() {
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
              onTap: () {
                promoCode(context);
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

  promoCode(BuildContext context) {
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
                height: 464.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34))),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 20.w),
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
                      SizedBox(height: 32.h),
                      //textfield
                      SizedBox(
                        height: 50.h,
                        width: 327.w,
                        child: TextFormField(
                          maxLines: 10,
                          controller: promoController,
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
                            suffixIcon: Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: const BoxDecoration(
                                    color: kColor.textColor,
                                    shape: BoxShape.circle),
                                child: const Center(
                                    child: Icon(Icons.arrow_forward,
                                        color: kColor.whiteColor))),
                            labelText: "Enter your promo code",
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
                                borderSide:
                                    BorderSide(color: kColor.whiteColor)),
                            contentPadding: EdgeInsets.only(
                                top: 7.h, left: 20.w, bottom: 10.h),
                            border: const OutlinedInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),

                      Text(
                        "Your Promo Codes",
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 18.sp,
                            color: kColor.textColor),
                      ),
                      SizedBox(height: 18.h),

                      //promocodes list
                      Expanded(
                          child: ListView.builder(
                        itemCount: promoCodes.length,
                        itemBuilder: (context, index) {
                          return PromoCodeCard(
                            promocode: promoCodes[index],
                            function: () {
                              setState(() {
                                promoController.text = promoCodes[index].code;
                                Provider.of<PromoCodePRovider>(context,
                                        listen: false)
                                    .setDiscount(promoCodes[index].discount);
                                Provider.of<PromoCodePRovider>(context,
                                        listen: false)
                                    .setPromoCode(promoCodes[index].code);
                                Navigator.pop(context);
                              });
                            },
                          );
                        },
                      ))
                    ],
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({
    super.key,
    required this.promocode,
    required this.function,
  });
  final void Function() function;
  final PromoCode promocode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Image.asset(
                  promocode.image,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 10.w,
                top: 23.h,
                bottom: 23.h,
                right: 10.w,
                child: Row(
                  children: [
                    Text(
                      "${promocode.discount.toInt()}",
                      style: appStyle(
                          fw: FontWeight.w600,
                          size: 34.sp,
                          color: promocode.textColor),
                    ),
                    Text(
                      "%\noff",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: promocode.textColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 14.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                promocode.title,
                style: appStyle(
                    fw: FontWeight.w600, size: 14.sp, color: kColor.textColor),
              ),
              SizedBox(height: 4.h),
              Text(
                promocode.code,
                style: appStyle(
                    fw: FontWeight.w500, size: 12.sp, color: kColor.textColor),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${promocode.remainingDays} days remaining",
                style: appStyle(
                    fw: FontWeight.w600, size: 13.sp, color: kColor.text2Color),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 36.h,
                width: 93.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kColor.redColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    onPressed: function,
                    child: Text(
                      "Apply",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.whiteColor),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
