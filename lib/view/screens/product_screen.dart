import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final valueListenable = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    String _selectedSize =
        Provider.of<RetrieveProductProvider>(context, listen: true)
            .selectedSize;

    String _selectedColor =
        Provider.of<RetrieveProductProvider>(context, listen: true)
            .sellectedColor;
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 10,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColor.textColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: kColor.textColor,
              ))
        ],
        centerTitle: true,
        title: Text(
          product.name,
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                fit: BoxFit.cover,
                product.image,
                width: 375.w,
                height: 413.h,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  //size
                  Container(
                    width: 110.w,
                    margin: EdgeInsets.only(left: 16.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kColor.redColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Size",
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                        ),
                        DropdownButton<String>(
                          alignment: AlignmentDirectional.bottomCenter,
                          value: _selectedSize,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: kColor.textColor,
                          ),
                          iconSize: 24.0,
                          elevation: 16,
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedSize = newValue!;
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .setSelectedSize(
                                      newValue); // Call callback with selected size
                            });
                          },
                          items: product.sizes
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<String>>((String size) {
                            return DropdownMenuItem<String>(
                              value: size,
                              child: Text(size),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  //color
                  Container(
                    width: 110.w,
                    margin: EdgeInsets.only(left: 16.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kColor.textColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Color",
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                        ),
                        DropdownButton<String>(
                          alignment: AlignmentDirectional.topStart,
                          value: _selectedColor,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: kColor.textColor,
                          ),
                          iconSize: 24.0,
                          elevation: 16,
                          style: appStyle(
                              fw: FontWeight.w500,
                              size: 16.sp,
                              color: kColor.textColor),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedColor = newValue!;
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .setSellectedColor(
                                      newValue); // Call callback with selected size
                            });
                          },
                          items: product.colors
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<String>>((String color) {
                            return DropdownMenuItem<String>(
                              value: color,
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kColor.text2Color),
                                    shape: BoxShape.circle,
                                    color: Color(int.parse(color))),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
