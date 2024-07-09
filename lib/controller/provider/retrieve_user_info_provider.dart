import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:flutter/material.dart';

class RetrieveUserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Userr> _users = [];
  List<Userr> get users => _users;

  Userr _user = Userr(email: "", name: "", password: "");
  Userr get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchUser() async {
    try {
      _isLoading = true;
      notifyListeners();

      final collectionRef = _firestore.collection('users');
      final querySnapshot = await collectionRef.get();
      final userId = await SecureStorage.readId("id");
      final users = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Userr(
          id: data['id'],
          name: data['name'],
          email: data['email'],
          image: data['image'],
          password: data['password'],
          favourites: data['favourites'].toString().split(', ').toList(),
          cart: data['cart'].cast<Map<String, dynamic>>(),
          cards: data['cards'].cast<Map<String, dynamic>>(),
          shippingAddress: data['shippingAddress'].cast<Map<String, dynamic>>(),
          selectedShippingAddress: data['selectedShippingAddress'],
          defaultCard: data['defaultCard'],
          orders: data['orders'].cast<Map<String, dynamic>>(),
        );
      }).toList();
      notifyListeners();
      _users = users;
      notifyListeners();
      _user = _users.firstWhere((e) => e.id == userId);
      _isLoading = false;
      notifyListeners();
    } on FirebaseException catch (error) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Firebase error fetching products: $error');
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Unexpected error fetching products: $error');
    }

    print(user.shippingAddress);
  }
}
