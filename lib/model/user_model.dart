import 'package:ecommerce_app/model/credit_card_model.dart';

class Userr {
  String? id;
  final String email;
  final String name;
  final String password;
  final String? image;
  List<String> favourites;
  List<Map<String, dynamic>> cart;
  List<Map<String, dynamic>> cards;
  Map<String, dynamic> defaultCard;
  List<Map<String, dynamic>> shippingAddress;
  Map<String, dynamic> selectedShippingAddress;
  List<Map<String, dynamic>> orders;
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
    this.defaultCard = const {},
    this.orders = const [],
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
        defaultCard: json["defaultCard"],
        orders: List<Map<String, String>>.from(json["orders"].map((x) => x)),
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
        "selectedShippingAddress": selectedShippingAddress,
        "defaultCard": defaultCard,
        "orders": orders.map((x) => x).toList(),
      };
}
