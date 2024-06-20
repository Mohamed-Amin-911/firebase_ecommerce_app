import 'dart:convert';

List<Product> productClassFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

enum Category { neww, clothes, shoes, accesories }

enum SubCategory {
  tops,
  shirtsAndBlouses,
  cardigansAndSweaters,
  knitwear,
  blazers,
  outerwear,
  pants,
  jeans,
  shorts,
  skirts,
  dresses
}

enum Gender { women, men, kids }

enum Size { XS, S, M, L, XL }

class Product {
  late String id;
  final String image;
  final Gender gender;
  final String name;
  final int rating;
  final Category category;
  final SubCategory subcategory;
  final double price;
  final bool isDiscount;
  final int discoutAmount;
  final List<Size> sizes;
  final List<String> colors;
  Product({
    required this.sizes,
    required this.colors,
    required this.image,
    required this.gender,
    required this.name,
    required this.rating,
    required this.category,
    required this.subcategory,
    required this.price,
    this.isDiscount = false,
    this.discoutAmount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        gender: json["gender"],
        image: json["image"],
        rating: json["rating"],
        category: json["category"],
        subcategory: json["subcategory"],
        price: json["price"],
        isDiscount: json["isDiscount"],
        discoutAmount: json["discoutAmount"],
        sizes: List<Size>.from(json["sizes"].map((x) => x)),
        colors: List<String>.from(json["colors"].map((x) => x)),
      );
}

List<Product> products = [
  Product(
    category: Category.neww,
    colors: ["0xffDB3022"],
    gender: Gender.women,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M, Size.L, Size.XL],
    subcategory: SubCategory.dresses,
  ),
  Product(
    category: Category.neww,
    colors: ["0xffDB3022"],
    gender: Gender.women,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M, Size.L, Size.XL],
    subcategory: SubCategory.dresses,
  ),
  Product(
    category: Category.neww,
    colors: ["0xffDB3022"],
    gender: Gender.women,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M, Size.L, Size.XL],
    subcategory: SubCategory.dresses,
  ),
  Product(
    category: Category.neww,
    colors: ["0xffDB3022"],
    gender: Gender.women,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M, Size.L, Size.XL],
    subcategory: SubCategory.dresses,
  ),
  Product(
    category: Category.neww,
    colors: ["0xffDB3022"],
    gender: Gender.women,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M, Size.L, Size.XL],
    subcategory: SubCategory.dresses,
  ),
];
