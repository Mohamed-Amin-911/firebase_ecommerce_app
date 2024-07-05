import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/bag_screens/add_address_screen.dart';
import 'package:ecommerce_app/view/screens/bag_screens/change_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.addresses,
    required this.selectedAddress,
  });

  final List<Map<String, dynamic>> addresses;
  final Map<String, dynamic> selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping address',
          style: appStyle(
              fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
        ),
        SizedBox(height: 21.h),
        Padding(
          padding: EdgeInsets.only(left: 28.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addresses.isEmpty
                  ? Row(
                      children: [
                        Text(
                          'No address',
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 14.sp,
                              color: kColor.textColor),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddAddressScreen(),
                                ));
                          },
                          child: Text(
                            'Add',
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.redColor),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              selectedAddress["fullName"]!,
                              style: appStyle(
                                  fw: FontWeight.w500,
                                  size: 14.sp,
                                  color: kColor.textColor),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangeAddressScreen(),
                                    ));
                              },
                              child: Text(
                                'Change',
                                style: appStyle(
                                    fw: FontWeight.w500,
                                    size: 14.sp,
                                    color: kColor.redColor),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${selectedAddress["address"]!}\n${selectedAddress["city"]}, ${selectedAddress["state"]!.substring(0, 1).toUpperCase()} ${selectedAddress["zipcode"]!}, ${selectedAddress["country"]!}",
                          style: appStyle(
                                  fw: FontWeight.w400,
                                  size: 14.sp,
                                  color: kColor.textColor)
                              .copyWith(height: 1.2.h),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
