import 'package:ecommerce_app/constants/text_style.dart';

import 'package:ecommerce_app/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        product.description,
        style:
            appStyle(fw: FontWeight.w500, size: 14.sp, color: kColor.textColor)
                .copyWith(height: 1.1.h),
      ),
    );
  }
}
