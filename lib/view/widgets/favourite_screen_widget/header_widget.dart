import 'package:ecommerce_app/constants/text_style.dart';

import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesScreenHeader extends StatelessWidget {
  const FavouritesScreenHeader({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorites",
            style: appStyle(
                fw: FontWeight.w600, size: 34.sp, color: kColor.textColor),
          ),
          SizedBox(height: 5.h),
          const TagsListWidget(),
          SizedBox(height: 5.h),
          //filters row
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     FavFiltersWidget(widget: widget),
          //     Row(children: [
          //       InkWell(
          //         onTap: () {
          //           setState(() {
          //             sort();
          //           });
          //         },
          //         child: const Icon(
          //           Icons.swap_vert,
          //           color: kColor.textColor,
          //         ),
          //       ),
          //       Text(
          //         isPriceLowToHight && !isPriceHighToLow
          //             ? " Price: lowest to high"
          //             : !isPriceLowToHight && isPriceHighToLow
          //                 ? " Price: highest to low"
          //                 : " sort by price",
          //         style: appStyle(
          //             fw: FontWeight.w500,
          //             size: 14.sp,
          //             color: kColor.textColor),
          //       ),
          //     ]),
          //     InkWell(
          //       onTap: () {},
          //       child: const Icon(
          //         Icons.view_list_rounded,
          //         color: kColor.textColor,
          //       ),
          //     ),
          //   ],
          // ),

          // SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
