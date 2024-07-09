import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/profile_screens/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final Map<String, dynamic> order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 19.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                  color: kColor.text2Color.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.outer)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order No ${order["orderNumber"]}",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
                const Spacer(),
                Text(
                  order["orderDate"],
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.text2Color),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Text(
                  "Tracking number: ",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.text2Color),
                ),
                Text(
                  "${order["trackingNumber"]}",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      "Quantity: ",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.text2Color),
                    ),
                    Text(
                      "${order["quantity"]}",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.textColor),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "Total amount: ",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.text2Color),
                    ),
                    Text(
                      "${order["orderTotal"]}",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.textColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kColor.whiteColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          side: const BorderSide(
                              color: kColor.textColor, width: 2))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailsScreen(
                            order: order,
                          ),
                        ));
                  },
                  child: Text(
                    "Details",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.textColor),
                  ),
                ),
                const Spacer(),
                Text(
                  "Processing",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.greenColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
