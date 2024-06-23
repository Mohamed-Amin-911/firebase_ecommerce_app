import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class ProductsScreenTitle extends StatelessWidget {
  const ProductsScreenTitle({
    super.key,
    required this.widget,
  });

  final ProductsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.gender[0].toUpperCase() + widget.gender.substring(1)}'s ${widget.subcat == "cardigansAndSweaters" ? "Cardigans & Sweaters" : widget.subcat == "shirtsAndBlouses" ? "Shirts & Blouses" : widget.subcat}",
      style:
          appStyle(fw: FontWeight.w500, size: 18.sp, color: kColor.textColor),
    );
  }
}
