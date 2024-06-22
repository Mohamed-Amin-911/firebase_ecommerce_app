import 'package:ecommerce_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class FiltersRowWidget extends StatefulWidget {
  const FiltersRowWidget({super.key});

  @override
  State<FiltersRowWidget> createState() => _FiltersRowWidgetState();
}

class _FiltersRowWidgetState extends State<FiltersRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: const Icon(
              Icons.filter_list_rounded,
              color: kColor.textColor,
            ),
          ),
          Text(
            " Filters",
            style: appStyle(
                fw: FontWeight.w500, size: 14.sp, color: kColor.textColor),
          ),
        ]),
        Row(children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.swap_vert,
              color: kColor.textColor,
            ),
          ),
          Text(
            " Price: lowest to high",
            style: appStyle(
                fw: FontWeight.w500, size: 14.sp, color: kColor.textColor),
          ),
        ]),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.view_list_rounded,
            color: kColor.textColor,
          ),
        ),
      ],
    );
  }
}
