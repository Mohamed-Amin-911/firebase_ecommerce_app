import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndPriceWidget extends StatelessWidget {
  const NameAndPriceWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.store,
                style: appStyle(
                    fw: FontWeight.w600, size: 24.sp, color: kColor.textColor),
              ),
              SizedBox(height: 5.h),
              Text(
                product.name,
                style: appStyle(
                    fw: FontWeight.w400, size: 12.sp, color: kColor.text2Color),
              ),
            ],
          ),
          Text(
            "\$${product.price.toString()}",
            style: appStyle(
                fw: FontWeight.w600, size: 24.sp, color: kColor.textColor),
          ),
        ],
      ),
    );
  }
}
