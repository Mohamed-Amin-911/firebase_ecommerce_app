import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/credit_card_provider.dart';
import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
import 'package:ecommerce_app/view/widgets/text_field_2_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<dynamic> addCardWidget(BuildContext context) {
  bool _isChecked = false;
  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expireDateController = TextEditingController();
  final cvvController = TextEditingController();

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
        return SizedBox(
          height: 552.h,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
            child: Scaffold(
              body: BottomSheet(
                dragHandleSize: Size(60.w, 6.h),
                showDragHandle: true,
                enableDrag: true,
                onClosing: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34)),
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 552.h,
                    width: double.infinity.w,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(34),
                            topRight: Radius.circular(34))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 26.h),
                            Center(
                              child: Text(
                                "Add new card",
                                style: appStyle(
                                    fw: FontWeight.bold,
                                    size: 18.sp,
                                    color: kColor.textColor),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            TextField2Widget(
                                controller: nameController,
                                label: "Name on card"),
                            TextField2Widget(
                                controller: cardNumberController,
                                label: "Card number"),
                            TextField2Widget(
                                controller: expireDateController,
                                label: "Expire Date"),
                            SizedBox(
                              height: 63.h,
                              width: 327.w,
                              child: TextFormField(
                                maxLines: 10,
                                controller: cvvController,
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
                                  suffixIcon: const Icon(
                                    Icons.help,
                                    color: kColor.text2Color,
                                  ),
                                  labelText: "CVV",
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
                                      borderSide:
                                          BorderSide(color: kColor.whiteColor)),
                                  contentPadding: EdgeInsets.only(
                                      top: 7.h, left: 20.w, bottom: 10.h),
                                  border: const OutlinedInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(height: 29.h),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: kColor.textColor,
                                  side: const BorderSide(
                                      color: kColor.text2Color, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  value: _isChecked,
                                  onChanged: (c) {
                                    setState(() {
                                      _isChecked = !_isChecked;
                                    });
                                  },
                                ),
                                Text(
                                  'Set as default payment method',
                                  style: appStyle(
                                      fw: FontWeight.w300,
                                      size: 12.sp,
                                      color: kColor.textColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 22.h),
                            SizedBox(
                              width: 343.w,
                              height: 48.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    backgroundColor: kColor.redColor,
                                    elevation: 0),
                                onPressed: () {
                                  nameController.text == "" ||
                                          cardNumberController.text == "" ||
                                          expireDateController.text == "" ||
                                          cvvController.text == ""
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "complete all the fields")),
                                        )
                                      : Provider.of<CreditCardProvider>(context,
                                              listen: false)
                                          .addCard({
                                          "name": nameController.text,
                                          "cardNumber":
                                              cardNumberController.text,
                                          "expireDate":
                                              expireDateController.text,
                                          "cvv": cvvController.text,
                                          "type":
                                              cardNumberController.text[0] ==
                                                          "5" ||
                                                      cardNumberController
                                                              .text[0] ==
                                                          "2"
                                                  ? "mastercard"
                                                  : "visa",
                                        }, context);

                                  nameController.text == "" ||
                                          cardNumberController.text == "" ||
                                          expireDateController.text == "" ||
                                          cvvController.text == ""
                                      ? null
                                      : _isChecked
                                          ? Provider.of<CreditCardProvider>(
                                                  context,
                                                  listen: false)
                                              .setDefualtCard({
                                              "name": nameController.text,
                                              "cardNumber":
                                                  cardNumberController.text,
                                              "expireDate":
                                                  expireDateController.text,
                                              "cvv": cvvController.text,
                                              "type": cardNumberController
                                                              .text[0] ==
                                                          "5" ||
                                                      cardNumberController
                                                              .text[0] ==
                                                          "2"
                                                  ? "mastercard"
                                                  : "visa",
                                            })
                                          : null;

                                  Provider.of<CreditCardProvider>(context,
                                          listen: false)
                                      .retrieveCards();

                                  Provider.of<CreditCardProvider>(context,
                                          listen: false)
                                      .retrieveDefaultCard();
                                  nameController.text == "" ||
                                          cardNumberController.text == "" ||
                                          expireDateController.text == "" ||
                                          cvvController.text == ""
                                      ? null
                                      : Navigator.pop(context);
                                  nameController.text == "" ||
                                          cardNumberController.text == "" ||
                                          expireDateController.text == "" ||
                                          cvvController.text == ""
                                      ? null
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          const SnackBar(
                                              content: Text("card added")),
                                        );

                                  nameController.clear();
                                  cardNumberController.clear();
                                  expireDateController.clear();
                                  cvvController.clear();
                                  _isChecked = false;
                                },
                                child: Text(
                                  "ADD CARD",
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
                    ),
                  );
                },
              ),
            ),
          ),
        );
      });
    },
  );
}
