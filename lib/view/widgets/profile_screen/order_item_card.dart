import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_user_info_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/widgets/profile_screen/order_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderItemCard extends StatefulWidget {
  const OrderItemCard({
    super.key,
    required this.order,
  });

  final Map<String, dynamic> order;

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<RetrieveUserProvider>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final Userr user =
        Provider.of<RetrieveUserProvider>(context, listen: true).user;
    List<Product> products =
        Provider.of<RetrieveProductProvider>(context, listen: true).products;
    return products.isEmpty
        ? SizedBox(
            width: double.infinity,
            height: 500.h,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: kColor.textColor,
                ),
              ],
            ),
          )
        : Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Order No ${widget.order["orderNumber"]}",
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 16.sp,
                            color: kColor.textColor),
                      ),
                      const Spacer(),
                      Text(
                        widget.order["orderDate"],
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.text2Color),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            "${widget.order["trackingNumber"]}",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.textColor),
                          ),
                        ],
                      ),
                      Text(
                        "Processing",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.greenColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "${widget.order["quantity"]} items",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.textColor),
                  ),
                  SizedBox(height: 18.h),
                  orderItemsList(products, widget.order),
                  SizedBox(height: 24.h),
                  Text(
                    "Order information",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.textColor),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Address:  ",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.text2Color),
                      ),
                      Text(
                        "${user.selectedShippingAddress["address"]} ,${user.selectedShippingAddress["city"]},\n${user.selectedShippingAddress["state"]} ${user.selectedShippingAddress["zipcode"]}, ${user.selectedShippingAddress["country"]}",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            "Payment method:  ",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.text2Color),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            user.defaultCard["cardNumber"][0] == "5" ||
                                    user.defaultCard["cardNumber"][0] == "2"
                                ? KImageAssets.mastercard
                                : KImageAssets.visa,
                            height: 35.h,
                            width: 42.w,
                          ),
                          SizedBox(width: 17.w),
                          Text(
                            '**** **** **** ${user.defaultCard["cardNumber"].substring(user.defaultCard["cardNumber"].length - 4)}',
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery method:    ",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.text2Color),
                      ),
                      Text(
                        "FedEx, 3 days, 15",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discount:                 ",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.text2Color),
                      ),
                      Text(
                        "10%, Personal promo code",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Amount          ",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.text2Color),
                      ),
                      Text(
                        "${widget.order["orderTotal"]}",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 34.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160.w,
                        height: 36.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kColor.whiteColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: kColor.textColor),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Text(
                            "Reorder",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.textColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 160.w,
                        height: 36.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kColor.redColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Text(
                            "Leave feedback",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          );
  }
}
