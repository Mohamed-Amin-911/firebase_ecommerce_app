import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.order,
  });

  final Map<String, dynamic> order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Order No ${order["orderNumber"]}",
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
            const Spacer(),
            Text(
              order["orderDate"],
              style: appStyle(
                  fw: FontWeight.w500, size: 14.sp, color: kColor.text2Color),
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
                  "${order["trackingNumber"]}",
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
                  fw: FontWeight.w500, size: 14.sp, color: kColor.greenColor),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          "${order["quantity"]} items",
          style: appStyle(
              fw: FontWeight.w500, size: 14.sp, color: kColor.textColor),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 360.h,
          width: double.infinity.w,
          child: Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: order["quantity"],
            itemBuilder: (context, index) {
              final Product product =
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .products
                      .firstWhere((product) =>
                          product.id == order["orderItems"][index]["id"]);

              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(product: product),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r)),
                        child: CachedNetworkImage(
                          width: 104.w,
                          height: 104.h,
                          fit: BoxFit.cover,
                          imageUrl: product.image,
                          placeholder: (context, url) => SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: const CircularProgressIndicator(
                              color: kColor.textColor,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: 11.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: appStyle(
                                fw: FontWeight.w600,
                                size: 16.sp,
                                color: kColor.textColor),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            product.category,
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 13.sp,
                                color: kColor.text2Color),
                          ),
                          SizedBox(height: 9.h),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Color: ",
                                    style: appStyle(
                                        fw: FontWeight.w500,
                                        size: 13.sp,
                                        color: kColor.text2Color),
                                  ),
                                  Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kColor.text2Color, width: 2),
                                        shape: BoxShape.circle,
                                        color: Color(int.parse(
                                            order["orderItems"][index]["color"]
                                                .toString()))),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.w),
                              Row(
                                children: [
                                  Text(
                                    "Size: ",
                                    style: appStyle(
                                        fw: FontWeight.w500,
                                        size: 13.sp,
                                        color: kColor.text2Color),
                                  ),
                                  Text(
                                    order["orderItems"][index]["size"],
                                    style: appStyle(
                                        fw: FontWeight.w500,
                                        size: 13.sp,
                                        color: kColor.textColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            children: [
                              Text(
                                "Units: ",
                                style: appStyle(
                                    fw: FontWeight.w500,
                                    size: 13.sp,
                                    color: kColor.text2Color),
                              ),
                              Text(
                                order["orderItems"][index]["quantity"],
                                style: appStyle(
                                    fw: FontWeight.w500,
                                    size: 13.sp,
                                    color: kColor.textColor),
                              ),
                              SizedBox(width: 130.w),
                              Text(
                                "${order["orderItems"][index]["price"].toInt()}\$",
                                style: appStyle(
                                    fw: FontWeight.w600,
                                    size: 14.sp,
                                    color: kColor.textColor),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        )
      ],
    );
  }
}
