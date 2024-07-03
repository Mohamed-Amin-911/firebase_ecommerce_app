import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/view/screens/product_screens/product_screen.dart';

import 'package:ecommerce_app/view/widgets/product_screen_widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/view/widgets/product_screen_widgets/product_dummy_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddToCartAndDummyWidget extends StatelessWidget {
  const AddToCartAndDummyWidget({
    super.key,
    required this.selectedColor,
    required this.selectedSize,
    required this.widget,
  });

  final String selectedColor;
  final String selectedSize;
  final ProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: const BoxDecoration(color: kColor.whiteColor, boxShadow: [
        BoxShadow(
            blurRadius: 8,
            spreadRadius: 8,
            color: Color.fromARGB(127, 155, 155, 155),
            offset: Offset(0, 2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddToCartButton(function: () {
            selectedColor == " " || selectedSize == " "
                ? ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("select a size and color")),
                  )
                : Provider.of<CartProvider>(context, listen: false).addToCart({
                    "price": widget.product.price,
                    "id": widget.product.id!,
                    "quantity": "1",
                    "size": selectedSize,
                    "color": selectedColor,
                  }, context);
          }),
          SizedBox(height: 30.h),
          const ProductDummyWidgets(),
        ],
      ),
    );
  }
}
