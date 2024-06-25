import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _db = FirebaseFirestore.instance;

class FavoritesProvider extends ChangeNotifier {
  bool isFavourited = false;

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
    isFavourited = false;

    notifyListeners();
  }

  // Future<void> checkFavourited(String productId) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user == null) return;

  //   final userId = await SecureStorage.readId("id");

  //   final collectionRef = _db.collection('users').doc(userId);
  //   final querySnapshot = await collectionRef.get();
  //   List<String> favourites = querySnapshot.data()?["favourites"] ?? [];

  //   if (favourites.contains(productId)) {
  //     isFavourited = true;
  //   }
  //   print(collectionRef);
  //   notifyListeners();
  // }

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
}
