import 'package:ecommerce_app/model/credit_card_model.dart';

class Userr {
  String? id;
  final String email;
  final String name;
  final String password;
  final String? image;
  List<String> favourites;
  List<Map<String, String>> cart;
  //  List<Order> orders;
  List<Map<String, String>> cards;
  List<String> shippingAddress;
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
    // this.orders=const[],
  });

  factory Userr.fromJson(Map<String, dynamic> json) => Userr(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        favourites: List<String>.from(json["favourites"].map((x) => x)),
        cart: List<Map<String, String>>.from(json["cart"].map((x) => x)),
        cards: List<Map<String, String>>.from(
            json["cards"].map((x) => CreditCard.fromJson(x))),
        shippingAddress:
            List<String>.from(json["shippingAddress"].map((x) => x)),
        // orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
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
        // "orders": orders.map((x) => x).toList(),
      };
}
