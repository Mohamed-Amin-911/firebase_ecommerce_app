import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/promoCode_provider.dart';
import 'package:ecommerce_app/model/promocode_model.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/promo_code_card.dart';
import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

promoCode(BuildContext context, TextEditingController promoController) {
  return showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    backgroundColor: kColor.whiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
    elevation: 10,
    enableDrag: true,
    barrierColor: const Color.fromARGB(94, 78, 78, 78),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (BuildContext context, setState) {
        return BottomSheet(
          enableDrag: true,
          onClosing: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
          builder: (BuildContext context) {
            return Container(
              height: 464.h,
              width: double.infinity.w,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34))),
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 13.h),
                    Center(
                      child: Container(
                        height: 6.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: kColor.text2Color,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    //textfield
                    SizedBox(
                      height: 50.h,
                      width: 327.w,
                      child: TextFormField(
                        maxLines: 10,
                        controller: promoController,
                        cursorColor: kColor.textColor,
                        cursorWidth: 1,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: "Metropolis",
                            fontSize: 14.sp,
                            color: kColor.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          suffixIcon: Container(
                              width: 36.w,
                              height: 36.h,
                              decoration: const BoxDecoration(
                                  color: kColor.textColor,
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(Icons.arrow_forward,
                                      color: kColor.whiteColor))),
                          labelText: "Enter your promo code",
                          floatingLabelStyle: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 14.sp,
                              color: kColor.text2Color,
                              fontWeight: FontWeight.w500),
                          labelStyle: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kColor.text2Color,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kColor.whiteColor,
                          )),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: kColor.whiteColor)),
                          contentPadding: EdgeInsets.only(
                              top: 7.h, left: 20.w, bottom: 10.h),
                          border: const OutlinedInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    Text(
                      "Your Promo Codes",
                      style: appStyle(
                          fw: FontWeight.w600,
                          size: 18.sp,
                          color: kColor.textColor),
                    ),
                    SizedBox(height: 18.h),

                    //promocodes list
                    Expanded(
                        child: ListView.builder(
                      itemCount: promoCodes.length,
                      itemBuilder: (context, index) {
                        return PromoCodeCard(
                          promocode: promoCodes[index],
                          function: () {
                            setState(() {
                              promoController.text = promoCodes[index].code;
                              Provider.of<PromoCodePRovider>(context,
                                      listen: false)
                                  .setDiscount(promoCodes[index].discount);
                              Provider.of<PromoCodePRovider>(context,
                                      listen: false)
                                  .setPromoCode(promoCodes[index].code);
                              Navigator.pop(context);
                            });
                          },
                        );
                      },
                    ))
                  ],
                ),
              ),
            );
          },
        );
      });
    },
  );
}
