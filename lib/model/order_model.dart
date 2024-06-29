///TODO:remove
class Order {
  final String id;
  final String userId;
  final String productId;
  final String quantity;
  final String price;

  Order({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "quantity": quantity,
        "price": price,
      };
}
