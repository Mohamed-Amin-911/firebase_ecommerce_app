import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<dynamic> sort(
    BuildContext context, bool isPriceLowToHight, bool isPriceHighToLow) {
  return showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    backgroundColor: kColor.whiteColor,
    elevation: 10,
    enableDrag: true,
    barrierColor: const Color.fromARGB(94, 78, 78, 78),
    context: context,
    builder: (BuildContext context) {
      return BottomSheet(
        enableDrag: true,
        onClosing: () {},
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Container(
              height: 300.h,
              width: double.infinity.w,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34))),
              child: Column(
                children: [
                  SizedBox(height: 13.h),
                  Container(
                    height: 6.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: kColor.text2Color,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 13.h),
                      Text(
                        "Sort by",
                        style: appStyle(fw: FontWeight.w600, size: 18.sp)
                            .copyWith(color: kColor.textColor),
                      ),
                      SizedBox(height: 36.h),
                      SizedBox(
                          height: 48.h,
                          width: double.infinity.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: isPriceLowToHight
                                    ? kColor.redColor
                                    : kColor.whiteColor,
                                shape: const ContinuousRectangleBorder()),
                            onPressed: () {
                              setState(() {
                                isPriceLowToHight = true;
                                isPriceHighToLow = false;
                                Provider.of<RetrieveProductProvider>(context,
                                        listen: false)
                                    .sortByPriceAscending();
                              });
                            },
                            child: Text(
                              "Price: lowest to high",
                              style: appStyle(fw: FontWeight.w600, size: 16.sp)
                                  .copyWith(
                                      color: isPriceLowToHight
                                          ? kColor.whiteColor
                                          : kColor.textColor),
                            ),
                          )),
                      SizedBox(
                          height: 48.h,
                          width: double.infinity.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: isPriceHighToLow
                                    ? kColor.redColor
                                    : kColor.whiteColor,
                                shape: const ContinuousRectangleBorder()),
                            onPressed: () {
                              setState(() {
                                isPriceHighToLow = true;
                                isPriceLowToHight = false;
                                Provider.of<RetrieveProductProvider>(context,
                                        listen: false)
                                    .sortByPriceDescending();
                              });
                            },
                            child: Text(
                              "Price: highest to low",
                              style: appStyle(fw: FontWeight.w600, size: 16.sp)
                                  .copyWith(
                                      color: isPriceHighToLow
                                          ? kColor.whiteColor
                                          : kColor.textColor),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            );
          });
        },
      );
    },
  );
}
