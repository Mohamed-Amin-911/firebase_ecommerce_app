import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/view/screens/filter_screen.dart';
import 'package:ecommerce_app/view/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/constants/colors.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({
    super.key,
    required this.widget,
  });

  final ProductsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
        onTap: () {
          Provider.of<RetrieveProductProvider>(context, listen: false)
              .fetchProducts();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilterScreen(
                  cat: widget.cat,
                  gender: widget.gender,
                  subcat: widget.subcat,
                ),
              ));
        },
        child: const Icon(
          Icons.filter_list_rounded,
          color: kColor.textColor,
        ),
      ),
      Text(
        " Filters",
        style:
            appStyle(fw: FontWeight.w500, size: 14.sp, color: kColor.textColor),
      ),
    ]);
  }
}