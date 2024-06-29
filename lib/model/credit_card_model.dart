import 'dart:convert';

///TODO:remove
List<CreditCard> creditCardClassFromJson(String str) =>
    List<CreditCard>.from(json.decode(str).map((x) => CreditCard.fromJson(x)));

class CreditCard {
  final String nameOnCard;
  final String cardNumber;
  final String expiryDate;

  CreditCard(
      {required this.nameOnCard,
      required this.cardNumber,
      required this.expiryDate});

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        nameOnCard: json["nameOnCard"],
        expiryDate: json["expiryDate"],
        cardNumber: json["cardNumber"],
      );
}
