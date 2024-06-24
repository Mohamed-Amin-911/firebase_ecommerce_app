import 'package:ecommerce_app/model/credit_card_model.dart';

class User {
  String? id;
  final String email;
  final String name;
  final String password;
  final String? image;
  final List<String> favourites;
  final List<String> cart;
  final List<CreditCard> cards;

  User({
    this.id,
    required this.email,
    required this.name,
    required this.password,
    this.image,
    this.favourites = const [],
    this.cart = const [],
    this.cards = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        favourites: List<String>.from(json["favourites"].map((x) => x)),
        cart: List<String>.from(json["cart"].map((x) => x)),
        cards: List<CreditCard>.from(
            json["cards"].map((x) => CreditCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "password": password,
        "favourites": favourites.map((x) => x).toList(),
        "cart": cart.map((x) => x).toList(),
        "cards": cards.map((x) => x).toList(),
      };
}
