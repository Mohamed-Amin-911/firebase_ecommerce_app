import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/controller/provider/credit_card_provider.dart';
import 'package:ecommerce_app/view/screens/bag_screens/success_screen.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/address_widget.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/deiver_&_total_amount_widget.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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

    Provider.of<AddressProvider>(context, listen: false).retrieveAddresses();
    Provider.of<AddressProvider>(context, listen: false)
        .retrieveSetSelectedAddress();

    Provider.of<CreditCardProvider>(context, listen: false).retrieveCards();
    Provider.of<CreditCardProvider>(context, listen: false)
        .retrieveDefaultCard();
  }

  @override
  Widget build(BuildContext context) {
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
