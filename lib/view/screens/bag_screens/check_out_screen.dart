import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/controller/provider/credit_card_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_user_info_provider.dart';
import 'package:ecommerce_app/view/screens/bag_screens/success_screen.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/address_widget.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/deiver_&_total_amount_widget.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).fetchCart(
      Provider.of<RetrieveProductProvider>(context, listen: false).products,
    );
    Provider.of<AddressProvider>(context, listen: false).retrieveAddresses();
    Provider.of<AddressProvider>(context, listen: false)
        .retrieveSetSelectedAddress();

    Provider.of<CreditCardProvider>(context, listen: false).retrieveCards();
    Provider.of<CreditCardProvider>(context, listen: false)
        .retrieveDefaultCard();
    Provider.of<RetrieveUserProvider>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int day = now.day;

    final List<Map<String, dynamic>> cartItems =
        Provider.of<CartProvider>(context, listen: true).items;

    final random = Random();

    // final Userr user =
    //     Provider.of<RetrieveUserProvider>(context, listen: true).user;

    List<Map<String, dynamic>> addresses =
        Provider.of<AddressProvider>(context, listen: true).addresses;

    Map<String, dynamic> selectedAddress =
        Provider.of<AddressProvider>(context, listen: true)
            .selectedShippingAddress;

    List<Map<String, dynamic>> cards =
        Provider.of<CreditCardProvider>(context, listen: true).cards;

    Map<String, dynamic> defaultCard =
        Provider.of<CreditCardProvider>(context, listen: true).defaultCard;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kColor.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColor.textColor,
            )),
        elevation: 0,
        title: Text(
          'Checkout',
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 31.h),
            //address
            AddressWidget(
                addresses: addresses, selectedAddress: selectedAddress),

            SizedBox(height: 45.h),
            //payment
            PaymentWidget(cards: cards, defaultCard: defaultCard),

            SizedBox(height: 51.h),
            DeliverAndTotalAmountWidget(widget: widget),
            SizedBox(height: 23.h),
            SizedBox(
              width: 343.w,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    backgroundColor: kColor.redColor,
                    elevation: 0),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addOrder({
                    "orderNumber": "${random.nextInt(10000000)}",
                    "orderDate":
                        "${month > 10 ? "0$month" : month}-${day > 10 ? "0$day" : day}-$year",
                    "trackingNumber": "IW${random.nextInt(1000000000)}",
                    "orderStatus": "processing",
                    "orderTotal": '${widget.totalPrice.toInt() + 15}\$',
                    "quantity": cartItems.length,
                    "orderItems": cartItems,
                  }, context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreen(),
                      ));
                },
                child: Text(
                  "SUBMIT ORDER",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
