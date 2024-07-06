import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Padding addressCard(void Function(bool?) function,
    List<Map<String, dynamic>> addresses, int indexx, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h, left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              addresses[indexx]["fullName"]!,
              style: appStyle(
                  fw: FontWeight.w500, size: 14.sp, color: kColor.textColor),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Edit',
                style: appStyle(
                    fw: FontWeight.w500, size: 14.sp, color: kColor.redColor),
              ),
            ),
          ],
        ),
        Text(
          "${addresses[indexx]["address"]!}\n${addresses[indexx]["city"]}, ${addresses[indexx]["state"]!.substring(0, 1).toUpperCase()} ${addresses[indexx]["zipcode"]!}, ${addresses[indexx]["country"]!}",
          style: appStyle(
                  fw: FontWeight.w400, size: 14.sp, color: kColor.textColor)
              .copyWith(height: 1.2.h),
        ),
        Row(
          children: [
            Checkbox(
              activeColor: kColor.textColor,
              side: const BorderSide(color: kColor.text2Color, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              value: indexx ==
                      Provider.of<AddressProvider>(context, listen: true)
                          .selectedIndex
                  ? true
                  : false,
              onChanged: function,
            ),
            Text(
              'Use as the shipping address',
              style: appStyle(
                  fw: FontWeight.w300, size: 12.sp, color: kColor.textColor),
            ),
          ],
        )
      ],
    ),
  );
}
