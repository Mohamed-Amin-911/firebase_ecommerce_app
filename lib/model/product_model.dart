enum Gender { women, men, kids }

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

enum Size { XS, S, M, L, XL }

class Product {
  String? id;
  final String image;
  final String gender;
  final String name;
  final double rating;
  final String category;
  final String subcategory;
  final double price;
  final bool isDiscount;
  final int discountAmount;
  final List<String> sizes;
  final List<String> colors;
  final List<String> reviews;
  final String store;

  Product({
    this.id,
    required this.sizes,
    required this.reviews,
    required this.colors,
    required this.image,
    required this.gender,
    required this.name,
    required this.rating,
    required this.category,
    required this.subcategory,
    required this.price,
    required this.store,
    this.isDiscount = false,
    this.discountAmount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        gender: Gender.values[json["gender"]].name,
        image: json["image"],
        rating: json["rating"],
        category: Category.values[json["category"]].name,
        subcategory: SubCategory.values[json["subcategory"]].name,
        price: json["price"],
        store: json["store"],
        isDiscount: json["isDiscount"],
        discountAmount: json["discountAmount"],
        sizes: List<String>.from(json["sizes"].map((x) => Size.values[x].name)),
        colors: List<String>.from(json["colors"].map((x) => x)),
        reviews: List<String>.from(json["reviews"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "image": image,
        "rating": rating,
        "category": category,
        "subcategory": subcategory,
        "price": price,
        "store": store,
        "isDiscount": isDiscount,
        "discountAmount": discountAmount,
        "sizes": sizes.map((x) => x).toList(),
        "colors": colors,
        "reviews": reviews,
      };
}

List<Product> products = [
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-Shirt SPANISH",
    price: 9,
    rating: 4,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: [],
    store: "Mango",
  ),
  Product(
    category: Category.neww.name,
    colors: ["0xffDB3022"],
    gender: Gender.women.name,
    image:
        "https://images.unsplash.com/photo-1718809070588-bc92009238b3?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "T-ShirtSPANISsssssH",
    price: 99,
    rating: 1,
    sizes: [Size.M.name, Size.L.name, Size.XL.name],
    subcategory: SubCategory.tops.name,
    reviews: ["zzzzzzzzzzz"],
    store: "Mazzzzzzzngo",
  ),
];
