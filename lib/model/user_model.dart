import 'dart:convert';

List<User> userClassFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  final String email;
  final String name;
  final String password;
  final List<String> favourites;
  final List<String> cart;

  User({
    required this.email,
    required this.name,
    required this.password,
    required this.favourites,
    required this.cart,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
        password: json["password"],
        favourites: List<String>.from(json["favourites"].map((x) => x)),
        cart: List<String>.from(json["cart"].map((x) => x)),
      );
}
