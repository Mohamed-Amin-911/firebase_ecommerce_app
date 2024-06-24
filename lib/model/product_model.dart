import 'dart:math';

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

List<Product> generateProducts() {
  final List<String> names = [
    "T-Shirt SPANISH",
    "Cool Sneakers",
    "Elegant Blazer",
    "Summer Dress",
    "Casual Jeans",
    // Add more unique product names
  ];

  final List<String> images = [
    "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1688821126709-895e6465b9a2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        "https://images.unsplash.com/photo-1517942420142-6a296f9ee4b1?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    // Add more unique image URLs
  ];

  final List<String> stores = [
    "Mango",
    "Zara",
    "H&M",
    "Uniqlo",
    "Gap",
    // Add more store names
  ];
  final List<String> colors = [
    "0xff020202",
    "0xffF6F6F6",
    "0xffB82222",
    "0xffBEA9A9",
    "0xffE2BB8D",
    "0xff151867",
  ];
  final Random random = Random();

  List<Product> products = List.generate(100, (index) {
    return Product(
      category: Category.values[random.nextInt(Category.values.length)].name,
      colors: [
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.values[random.nextInt(Gender.values.length)].name,
      image: images[random.nextInt(images.length)],
      name: names[random.nextInt(names.length)],
      price: 5 + random.nextInt(1000).toDouble(), // Prices between 5 and 104
      rating: 1 + random.nextInt(5).toDouble(), // Ratings between 1 and 5
      sizes: ["XS", "S", "M", "L", "XL"],
      subcategory:
          SubCategory.values[random.nextInt(SubCategory.values.length)].name,
      reviews: [], // Add review texts if needed
      store: stores[random.nextInt(stores.length)],
    );
  });

  return products;
}

List<Product> products = generateProducts();
