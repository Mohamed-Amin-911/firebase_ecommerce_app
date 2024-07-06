import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreditCardProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _cards = [];
  List<Map<String, dynamic>> get cards => _cards;

  Map<String, dynamic> _defaultCard = {};
  Map<String, dynamic> get defaultCard => _defaultCard;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  Future<void> setselectedIndex(int index) async {
    _selectedIndex = index;

    notifyListeners();
  }

  Future<void> addCard(Map<String, dynamic> card, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "cards": FieldValue.arrayUnion([card]),
    });

    // retrieveCards();
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("card added")),
    );

    notifyListeners();
  }

  Future<void> retrieveCards() async {
    _isLoading = true;
    notifyListeners();
    final userId = await SecureStorage.readId("id");
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        List<dynamic> retrievedCards = userDoc.get('cards');
        _cards = retrievedCards
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
  }

  Future<void> editCard(
      String oldcardnumber, Map<String, String> newCard) async {
    int index = _cards.indexWhere((e) => e["cardnumber"] == oldcardnumber);

    _cards.removeAt(index);
    _cards.insert(index, {
      "name": newCard["name"]!,
      "cardnumber": newCard["cardnumber"]!,
      "date": newCard["date"]!,
      "type": newCard["type"]!,
      "cvv": newCard["cvv"]!,
    });

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    await userRef.set({
      "cards": _cards.toSet().toList(),
    });

    notifyListeners();
  }

  Future<void> setDefualtCard(Map<String, dynamic> defaultCard) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = await SecureStorage.readId("id");

    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      "defaultCard": defaultCard,
    });

    notifyListeners();
  }

  Future<void> retrieveDefaultCard() async {
    final userId = await SecureStorage.readId("id");
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        Map<String, dynamic> cardData = userDoc.get('defaultCard');
        _defaultCard = cardData;
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
