import 'package:flutter/material.dart';

class PromoCodePRovider extends ChangeNotifier {
  double _discount = 0;
  double get discount => _discount;
  void setDiscount(double discount) {
    _discount = discount;
    notifyListeners();
  }

  String _promoCodeTxt = "";
  String get promoCodeTxt => _promoCodeTxt;
  void setPromoCode(String promoCode) {
    _promoCodeTxt = promoCode;
    notifyListeners();
  }
}
