import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _addresses = [];
  List<Map<String, dynamic>> get addresses => _addresses;

  Map<String, dynamic> _selectedShippingAddress = {};
  Map<String, dynamic> get selectedShippingAddress => _selectedShippingAddress;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> addAddress(
      Map<String, String> address, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "shippingAddress": FieldValue.arrayUnion([address]),
    });

    retrieveAddresses();
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("address added")),
    );

    notifyListeners();

    print(addresses.length);
  }

  Future<void> retrieveAddresses() async {
    _isLoading = true;
    notifyListeners();
    final userId = await SecureStorage.readId("id");
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        List<dynamic> retrievedAddresses = userDoc.get('shippingAddress');
        _addresses = retrievedAddresses
            .map((item) => Map<String, String>.from(item))
            .toList();
        notifyListeners();
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }

    notifyListeners();

    print(addresses.length);
  }

  Future<void> editAddress(
      String oldAddress, Map<String, String> newAddress) async {
    int index = _addresses.indexWhere((e) => e["address"] == oldAddress);

    _addresses.removeAt(index);
    _addresses.insert(index, {
      "name": newAddress["name"]!,
      "address": newAddress["address"]!,
      "city": newAddress["city"]!,
      "state": newAddress["state"]!,
      "zipcode": newAddress["zipcode"]!,
      "country": newAddress["country"]!,
    });

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    await userRef.set({
      "shippingAddress": _addresses.toSet().toList(),
    });

    notifyListeners();
  }

  Future<void> setSelectedAddress(Map<String, dynamic> selectedAddress) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "selectedShippingAddress": selectedAddress,
    });

    notifyListeners();
  }

  Future<void> retrieveSetSelectedAddress() async {
    _isLoading = true;
    notifyListeners();
    final userId = await SecureStorage.readId("id");
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        Map<String, dynamic> cartData = userDoc.get('selectedShippingAddress');
        _selectedShippingAddress = cartData;
        notifyListeners();
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching address: $e');
    }

    notifyListeners();
  }
}
