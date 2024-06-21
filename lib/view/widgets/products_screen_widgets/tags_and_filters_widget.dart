import 'package:ecommerce_app/view/widgets/products_screen_widgets/filters_row_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagsAndFiltersWidget extends StatelessWidget {
  const TagsAndFiltersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.outer,
            color: Color.fromARGB(144, 155, 155, 155),
            blurRadius: 30,
            spreadRadius: 22,
            offset: Offset(0, -10))
      ]),
      child: Column(
        children: [
          const TagsListWidget(),
          SizedBox(height: 20.h),
          const FiltersRowWidget(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
