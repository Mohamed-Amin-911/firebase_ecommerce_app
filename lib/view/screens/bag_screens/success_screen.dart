import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              KImageAssets.success,
              width: 208.w,
              height: 213.h,
            ),
            SizedBox(height: 39.h),
            Text(
              "Success!",
              style: appStyle(
                  fw: FontWeight.bold, size: 34.sp, color: kColor.textColor),
            ),
            SizedBox(height: 12.h),
            Text(
              "Your order will be delivered soon.\nThank you for choosing our app!",
              style: appStyle(
                      fw: FontWeight.w500, size: 14.sp, color: kColor.textColor)
                  .copyWith(height: 1.1.h),
            ),
            SizedBox(height: 163.h),
            SizedBox(
              width: 343.w,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    backgroundColor: kColor.redColor,
                    elevation: 0),
                onPressed: () {
                  for (var i
                      in Provider.of<CartProvider>(context, listen: false)
                          .items) {
                    Provider.of<CartProvider>(context, listen: false)
                        .removeFromCart(i);
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ));
                },
                child: Text(
                  "CONTINUE SHOPPING",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
