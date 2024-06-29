import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UploadUserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isUploading = false;

  bool get isUploading => _isUploading;

  Future<void> uploadUser(Userr user) async {
    try {
      _isUploading = true;
      notifyListeners(); // Notify UI about upload start

      final collectionRef = _firestore.collection('users');
      final batch = _firestore.batch();

      final docRef = collectionRef.doc(); // Generate unique IDs
      SecureStorage.writeId("id", docRef.id);
      final Map<String, dynamic> data = {
        'id': docRef.id,
        'name': user.name,
        "email": user.email,
        "image": user.image,
        "password": user.password,
        "favourites": user.favourites.map((x) => x).toList(),
        "cart": user.cart.map((x) => x).toList(),
        "cards": user.cards.map((x) => x).toList(),
        "shippingAddress": user.shippingAddress.map((x) => x).toList(),
      };

      batch.set(docRef, data);

      await batch.commit(); // Write all documents in a single batch

      _isUploading = false;
      notifyListeners(); // Notify UI about upload completion
    } on FirebaseException catch (error) {
      _isUploading = false;
      notifyListeners(); // Notify UI about upload error
      // Handle Firebase-specific errors (e.g., network issues, permission errors)
      debugPrint('error: $error');
      // Optionally, show a snackbar or dialog to the user
    } catch (error) {
      _isUploading = false;
      notifyListeners(); // Notify UI about upload error
      // Handle generic errors (e.g., unexpected exceptions)
      debugPrint('error: $error');
      // Optionally, show a generic error message to the user
    }
  }
}
