import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  final List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> addToCart(
      Map<String, dynamic> productData, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "cart": FieldValue.arrayUnion([productData]),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("item added to cart")),
    );
    notifyListeners();
  }

  Future<void> removeFromCart(Map<String, dynamic> productData) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "cart": FieldValue.arrayRemove([productData]),
    });

    notifyListeners();
  }

  Future<void> fetchCart(List<Product> prods) async {
    _isLoading = true;
    notifyListeners();
    final userId = await SecureStorage.readId("id");
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        List<dynamic> cartData = userDoc.get('cart');
        _items =
            cartData.map((item) => Map<String, dynamic>.from(item)).toList();
        notifyListeners();
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetchicvcvncvnng cart: $e');
    }
    getProductsFromFavs(prods);
    getTotalPrice();

    notifyListeners();
  }

  Future<void> getProductsFromFavs(List<Product> prods) async {
    _products.clear();
    for (var i in _items) {
      _products.addAll(prods.where((product) => product.id == i["id"]));
    }
    getTotalPrice();
    notifyListeners();
  }

  Future<void> changeQuantity(double price, String productId, String color,
      int quantity, String size, List<Product> prods) async {
    List<Map<String, String>> editedItems = [];
    int index = _items.indexWhere((e) =>
        e["id"] == productId && e["color"] == color && e["size"] == size);

    _items.removeAt(index);
    _items.insert(index, {
      "color": color,
      "id": productId,
      "quantity": quantity.toString(),
      "size": size,
      "price": price,
    });

    editedItems;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    await userRef.update({
      "cart": _items.toSet().toList(),
    });

    getTotalPrice();
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0;

    for (var item in _items) {
      totalPrice += (item["price"] * int.parse(item["quantity"]!));
    }
    return totalPrice;
  }
}
