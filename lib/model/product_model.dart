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
  final String description;

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
    required this.description,
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
        description: json["description"],
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
        "description": description
      };
}

// List<Product> generateProducts() {
//   final List<String> names = [
//     "T-Shirt SPANISH",
//     "Cool Sneakers",
//     "Elegant Blazer",
//     "Summer Dress",
//     "Casual Jeans",
//     // Add more unique product names
//   ];

//   final List<String> images = [
//     "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     "https://plus.unsplash.com/premium_photo-1688821126709-895e6465b9a2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
//         "https://images.unsplash.com/photo-1517942420142-6a296f9ee4b1?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
//     // Add more unique image URLs
//   ];

//   final List<String> stores = [
//     "Mango",
//     "Zara",
//     "H&M",
//     "Uniqlo",
//     "Gap",
//   ];

//   final Random random = Random();

//   List<Product> products = List.generate(100, (index) {
//     return Product(
//       category: Category.values[random.nextInt(Category.values.length)].name,
//       colors: [
//         " ",
//         "0xff020202",
//         "0xffF6F6F6",
//         "0xffB82222",
//         "0xffBEA9A9",
//         "0xffE2BB8D",
//         "0xff151867",
//       ],
//       gender: Gender.values[random.nextInt(Gender.values.length)].name,
//       image: images[random.nextInt(images.length)],
//       name: names[random.nextInt(names.length)],
//       price: 5 + random.nextInt(1000).toDouble(), // Prices between 5 and 104
//       rating: 1 + random.nextInt(5).toDouble(), // Ratings between 1 and 5
//       sizes: [" ", "XS", "S", "M", "L", "XL"],
//       subcategory:
//           SubCategory.values[random.nextInt(SubCategory.values.length)].name,
//       reviews: [], // Add review texts if needed
//       store: stores[random.nextInt(stores.length)],
//       description:
//           "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
//     );
//   });

//   return products;
// }

// List<Product> products = generateProducts();

List<Product> products = [
  Product(
      reviews: [],
      rating: 0,
      store: "ZARA",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.women.name,
      price: 123,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Dress",
      category: Category.neww.name,
      subcategory: SubCategory.dresses.name,
      description: "A beautiful long green dress on a hanger on a white wall",
      image:
          "https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Product(
      reviews: [],
      rating: 0,
      store: "IZOD",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.men.name,
      price: 123,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Short Sleeve Polo Shirt",
      category: Category.neww.name,
      subcategory: SubCategory.tops.name,
      description:
          "POLO SHIRTS FOR MEN: IZOD Advantage Performance polos for men deliver an easy casual design combined with timeless style. Our men's polo shirts are comfortable, versatile, and perfect for a wide variety of occasions.",
      image: "https://m.media-amazon.com/images/I/71Yx+D91IrL._AC_SX679_.jpg"),
  Product(
      reviews: [],
      rating: 0,
      store: "ZARA",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.men.name,
      price: 27,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Casual Polo Shirts Classic Button",
      category: Category.neww.name,
      subcategory: SubCategory.tops.name,
      description:
          "Men's Casual Polo Shirts Classic Button Basic Short Sleeve Shirt Solid Color Cotton Tees Golf Stylish Tops",
      image: "https://m.media-amazon.com/images/I/71KQK+TcbZL._AC_SX679_.jpg"),
  Product(
      reviews: [],
      rating: 0,
      store: "NITAGUT",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.men.name,
      price: 200,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Men's Polo Shirt",
      category: Category.neww.name,
      subcategory: SubCategory.tops.name,
      description:
          "Classic fit short shirt, slim fit, polo collar with a sporty buttoned. You should be an exquisite man! A classic cut and soft fabric make this shirts fit for summer !",
      image: "https://m.media-amazon.com/images/I/71t9VNqww0L._AC_SX679_.jpg"),
  Product(
      reviews: [],
      rating: 0,
      store: "ZARA",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.women.name,
      price: 123,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Dress",
      category: Category.neww.name,
      subcategory: SubCategory.dresses.name,
      description: "A beautiful long green dress on a hanger on a white wall",
      image:
          "https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Product(
      reviews: [],
      rating: 0,
      store: "IZOD",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.men.name,
      price: 55,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Mens V Neck t Shirt",
      category: Category.neww.name,
      subcategory: SubCategory.tops.name,
      description:
          "We pursuit perfection on material choices of our clothes. The material of these golf shirts for men dry fit polo is ultra-soft and stretchy, ensuring a lot of give for your easy movement. The just right thickness provides fine wrinkle resistance. Even after several washings it would still hold its finish, color, and shape.",
      image: "https://m.media-amazon.com/images/I/61HZiA63V-L._AC_SX569_.jpg"),
  Product(
      reviews: [],
      rating: 0,
      store: "COOFANDY",
      colors: [
        " ",
        "0xff020202",
        "0xffF6F6F6",
        "0xffB82222",
        "0xffBEA9A9",
        "0xffE2BB8D",
        "0xff151867",
      ],
      gender: Gender.men.name,
      price: 31,
      sizes: [" ", "XS", "S", "M", "L", "XL"],
      name: "Men's Knit Shirts Short Sleeve",
      category: Category.neww.name,
      subcategory: SubCategory.tops.name,
      description:
          "Material: Men's casual button down shirt is made of soft knit fabric. Lightweight and breathable men's short sleeve knitted polo shirts provide you a comfortable and cool feeling wearing experience.",
      image: "https://m.media-amazon.com/images/I/81wHPAtN8mL._AC_SX569_.jpg"),
];
