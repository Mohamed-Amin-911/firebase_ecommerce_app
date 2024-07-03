import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/view/screens/add_address_screen.dart';
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

            Text(
              'Shipping address',
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
            SizedBox(height: 21.h),
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addresses.isEmpty
                      ? Row(
                          children: [
                            Text(
                              'No address',
                              style: appStyle(
                                  fw: FontWeight.w500,
                                  size: 14.sp,
                                  color: kColor.textColor),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AddAddressScreen(),
                                    ));
                              },
                              child: Text(
                                'Add',
                                style: appStyle(
                                    fw: FontWeight.w500,
                                    size: 14.sp,
                                    color: kColor.redColor),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  selectedAddress["fullName"]!,
                                  style: appStyle(
                                      fw: FontWeight.w500,
                                      size: 14.sp,
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
                            Text(
                              "${selectedAddress["address"]!}\n${selectedAddress["city"]}, ${selectedAddress["state"]!.substring(0, 1).toUpperCase()} ${selectedAddress["zipcode"]!}, ${selectedAddress["country"]!}",
                              style: appStyle(
                                      fw: FontWeight.w400,
                                      size: 14.sp,
                                      color: kColor.textColor)
                                  .copyWith(height: 1.2.h),
                            ),
                          ],
                        ),
                ],
              ),
            ),
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

            //delivery
            SizedBox(height: 51.h),
            Text(
              'Delivery method',
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
            SizedBox(height: 21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(KImageAssets.fedex),
                      SizedBox(height: 11.h),
                      Text(
                        ' 2-3 days',
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 12.sp,
                            color: kColor.text2Color),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(KImageAssets.usps),
                      SizedBox(height: 11.h),
                      Text(
                        ' 2-3 days',
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 12.sp,
                            color: kColor.text2Color),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(KImageAssets.dhl),
                      SizedBox(height: 11.h),
                      Text(
                        ' 2-3 days',
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 12.sp,
                            color: kColor.text2Color),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 52.h),
            //total amount
            Row(
              children: [
                Text(
                  'Order:',
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.text2Color),
                ),
                const Spacer(),
                Text(
                  '${widget.totalPrice.toInt()}\$',
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                Text(
                  'Delivery:',
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.text2Color),
                ),
                const Spacer(),
                Text(
                  '15\$',
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                Text(
                  'Summary:',
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 14.sp,
                      color: kColor.text2Color),
                ),
                const Spacer(),
                Text(
                  '${widget.totalPrice.toInt() + 15}\$',
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
