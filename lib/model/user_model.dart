import 'package:ecommerce_app/model/credit_card_model.dart';

class Userr {
  String? id;
  final String email;
  final String name;
  final String password;
  final String? image;
  List<String> favourites;
  List<Map<String, dynamic>> cart;
  List<Map<String, String>> cards;

  List<Map<String, String>> shippingAddress;

  Map<String, String> selectedShippingAddress;
  Userr({
    this.id,
    required this.email,
    required this.name,
    required this.password,
    this.image,
    this.favourites = const [],
    this.cart = const [],
    this.cards = const [],
    this.shippingAddress = const [],
    this.selectedShippingAddress = const {},
  });

  factory Userr.fromJson(Map<String, dynamic> json) => Userr(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        favourites: List<String>.from(json["favourites"].map((x) => x)),
        cart: List<Map<String, dynamic>>.from(json["cart"].map((x) => x)),
        cards: List<Map<String, String>>.from(
            json["cards"].map((x) => CreditCard.fromJson(x))),
        shippingAddress: List<Map<String, String>>.from(
            json["shippingAddress"].map((x) => x)),
        selectedShippingAddress: json["selectedShippingAddress"],
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
        "shippingAddress": shippingAddress.map((x) => x).toList(),
        "selectedShippingAddress": selectedShippingAddress
      };
}
