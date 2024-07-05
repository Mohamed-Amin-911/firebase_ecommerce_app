import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/address_widget.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/deiver_&_total_amount_widget.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> addresses =
        Provider.of<AddressProvider>(context, listen: true).addresses;

    Map<String, dynamic> selectedAddress =
        Provider.of<AddressProvider>(context, listen: true)
            .selectedShippingAddress;
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

            SizedBox(height: 77.h),
            //payment
            Row(
              children: [
                Text(
                  'Payment',
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.redColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                SizedBox(width: 16.w),
                Image.asset(KImageAssets.mastercard),
                SizedBox(width: 33.w),
                Text(
                  '**** **** **** 3947',
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
              ],
            ),

            SizedBox(height: 51.h),
            DeliverAndTotalAmountWidget(widget: widget),
          ],
        ),
      ),
    );
  }
}
