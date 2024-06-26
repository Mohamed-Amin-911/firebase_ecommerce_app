import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _db = FirebaseFirestore.instance;

class FavoritesProvider extends ChangeNotifier {
  bool isFavourited = false;
  List<String> _favorites = [];
  List<String> get favorites => _favorites;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> addToFavorites(String productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "favourites": FieldValue.arrayUnion([productId]),
    });
    isFavourited = true;
    notifyListeners();
  }

  Future<void> removeFavorites(String productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "favourites": FieldValue.arrayRemove([productId]),
    });
    notifyListeners();
    isFavourited = false;

    notifyListeners();
  }

  Future<bool> isFavorite(String productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    final userId = await SecureStorage.readId("id");
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    final documentSnapshot = await userRef.get();
    final List<String> favorites = documentSnapshot
            .data()?['favourites']
            .toString()
            .substring(1,
                (documentSnapshot.data()?['favourites'].toString().length)! - 1)
            .split(", ")
            .toList() ??
        [];

    return favorites.contains(productId);
  }

  Future<void> retrieveFavorites() async {
    _isLoading = true;
    notifyListeners();

    final userId = await SecureStorage.readId("id");
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    final documentSnapshot = await userRef.get();
    _favorites = documentSnapshot
            .data()?['favourites']
            .toString()
            .substring(1,
                (documentSnapshot.data()?['favourites'].toString().length)! - 1)
            .split(", ")
            .toList() ??
        [];

    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }

  Future<List<Product>> getProductsFromFavs(List<Product> prods) async {
    final List<Product> pp = [];
    for (var i in _favorites) {
      pp.add(prods.firstWhere((product) => product.id == i));
    }
    return pp;
  }
}
