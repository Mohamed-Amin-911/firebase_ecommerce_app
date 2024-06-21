import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

class UploadProductProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isUploading = false;

  bool get isUploading => _isUploading;

  Future<void> uploadProducts(List<Product> products) async {
    try {
      _isUploading = true;
      notifyListeners(); // Notify UI about upload start

      final collectionRef = _firestore.collection('products');
      final batch = _firestore.batch();

      for (final product in products) {
        final docRef = collectionRef.doc(); // Generate unique IDs

        final Map<String, dynamic> data = {
          'id': docRef.id, // Use document ID as product ID
          'name': product.name,
          'gender': product.gender.toString().split('.').last,
          'image': product.image,
          'rating': product.rating,
          'category': product.category.toString().split('.').last,
          'subcategory': product.subcategory.toString().split('.').last,
          'price': product.price,
          'store': product.store,
          'isDiscount': product.isDiscount,
          'discountAmount': product.discountAmount,
          'sizes': product.sizes
              .map((size) => size.toString().split('.').last)
              .toList(), // Convert sizes to strings and list
          'colors': product.colors, // Already a list of strings
          'reviews': product.reviews,
        };

        batch.set(docRef, data);
      }

      await batch.commit(); // Write all documents in a single batch

      _isUploading = false;
      notifyListeners(); // Notify UI about upload completion
    } on FirebaseException catch (error) {
      _isUploading = false;
      notifyListeners(); // Notify UI about upload error
      // Handle Firebase-specific errors (e.g., network issues, permission errors)
      debugPrint('Firebase error uploading products: $error');
      // Optionally, show a snackbar or dialog to the user
    } catch (error) {
      _isUploading = false;
      notifyListeners(); // Notify UI about upload error
      // Handle generic errors (e.g., unexpected exceptions)
      debugPrint('Unexpected error uploading products: $error');
      // Optionally, show a generic error message to the user
    }
  }
}
