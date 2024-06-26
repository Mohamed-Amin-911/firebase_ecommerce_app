import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColor.whiteColor,
            )),
        centerTitle: true,
        elevation: 5,
        shadowColor: const Color.fromARGB(118, 155, 155, 155),
        backgroundColor: kColor.whiteColor,
        title: Text(
          "Filters",
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          children: [
            SizedBox(height: 14.h),
            Text(
              "Price range",
              style: appStyle(
                  fw: FontWeight.w600, size: 16.sp, color: kColor.textColor),
            ),
            SizedBox(height: 14.h),
            RangeSlider(
              values: RangeValues(
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .minPrice,
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .maxPrice),
              activeColor: kColor.redColor,
              inactiveColor: kColor.text2Color,
              min: 10,
              max: 1500,
              divisions: 10,
              labels: RangeLabels(
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .minPrice
                      .toStringAsFixed(2),
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .maxPrice
                      .toStringAsFixed(2)),
              onChanged: (values) {
                setState(() {
                  Provider.of<RetrieveProductProvider>(context, listen: false)
                      .setMinPrice(values.start);
                  Provider.of<RetrieveProductProvider>(context, listen: false)
                      .setMaxPrice(values.end);
                });
              },
            ),
            SizedBox(height: 14.h),
            Wrap(
              children: [
                "0xff020202",
                "0xffF6F6F6",
                "0xffB82222",
                "0xffBEA9A9",
                "0xffE2BB8D",
                "0xff151867",
              ]
                  .map((color) => FilterChip(
                        backgroundColor: kColor.whiteColor,
                        showCheckmark: false,
                        selectedColor: kColor.redColor,
                        shape: const CircleBorder(),
                        label: Container(
                          width: 33.w,
                          height: 33.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: kColor.whiteColor, width: 4),
                              color: Color(int.parse(color))),
                        ),
                        selected: Provider.of<RetrieveProductProvider>(context,
                                listen: true)
                            .selectedColors
                            .contains(color),
                        onSelected: (isSelected) {
                          setState(() {
                            if (isSelected) {
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .setSelectedColors(color);
                            } else {
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .removeSelectedColors(color);
                            }
                          });
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160.w,
                height: 36.w,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: kColor.whiteColor,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                              color: kColor.textColor,
                            ),
                            borderRadius: BorderRadius.circular(24))),
                    child: Text(
                      "Discard",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.textColor),
                    )),
              ),
              SizedBox(
                width: 160.w,
                height: 36.w,
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<RetrieveProductProvider>(context,
                              listen: false)
                          .filterProducts();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: kColor.redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    child: Text(
                      "Apply",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 14.sp,
                          color: kColor.whiteColor),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
