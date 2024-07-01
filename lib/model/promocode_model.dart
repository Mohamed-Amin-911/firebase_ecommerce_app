import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:flutter/material.dart';

class PromoCode {
  int remainingDays;
  String image;
  String title;
  String code;
  double discount;
  Color textColor;
  PromoCode({
    required this.code,
    required this.discount,
    required this.image,
    required this.title,
    required this.remainingDays,
    required this.textColor,
  });
}

List<PromoCode> promoCodes = [
  PromoCode(
      textColor: kColor.whiteColor,
      code: "mypromocode2024",
      discount: 10,
      image: KImageAssets.tenPromo,
      title: "Personal offer",
      remainingDays: 6),
  PromoCode(
      textColor: kColor.textColor,
      code: "summer2024",
      discount: 15,
      image: KImageAssets.fifteenPromo,
      title: "Summer Sale",
      remainingDays: 23),
];
