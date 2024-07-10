import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ReviewProvider extends ChangeNotifier {
  List<String> _reviews = [];
  List<String> get reviews => _reviews;
  double _rating = 0;
  double get rating => _rating;

  Future<void> fetchProductReviews(String id) async {
    final prodRef = FirebaseFirestore.instance.collection('products').doc(id);

    final documentSnapshot = await prodRef.get();
    _reviews = documentSnapshot
            .data()?['reviews']
            .toString()
            .substring(
                1, (documentSnapshot.data()?['reviews'].toString().length)! - 1)
            .split(", ")
            .toList() ??
        [];
    notifyListeners();
  }

  Future<void> fetchProductRating(String id) async {
    final prodRef = FirebaseFirestore.instance.collection('products').doc(id);

    final documentSnapshot = await prodRef.get();
    _rating = documentSnapshot.data()?['rating'];

    notifyListeners();
  }

  Future<void> addProductReview(String productId, String reviewText) async {
    final reviewRef =
        FirebaseFirestore.instance.collection('products').doc(productId);
    await reviewRef.update({
      "reviews": FieldValue.arrayUnion([reviewText]),
    });

    notifyListeners();
  }

  Future<void> addProductRate(String productId, double rating) async {
    final reviewRef =
        FirebaseFirestore.instance.collection('products').doc(productId);

    await reviewRef.update({
      "rating": rating,
    });

    notifyListeners();
  }
}
