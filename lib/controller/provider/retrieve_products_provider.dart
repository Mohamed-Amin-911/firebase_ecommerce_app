import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

class RetrieveProductProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      notifyListeners(); // Notify UI about loading start

      final collectionRef = _firestore.collection('products');
      final querySnapshot = await collectionRef.get();

      final products = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Product(
          id: data['id'],
          name: data['name'],
          gender: data['gender'],
          image: data['image'],
          rating: data['rating'],
          category: data['category'],
          subcategory: data['subcategory'],
          price: data['price'],
          store: data['store'],
          isDiscount: data['isDiscount'],
          discountAmount: data['discountAmount'],
          sizes: data['sizes'].toString().split(',').toList(),
          colors: data['colors'].toString().split(',').toList(),
          reviews: data['reviews'].toString().split(',').toList(),
        );
      }).toList();

      _products = products;

      _isLoading = false;
      notifyListeners(); // Notify UI about product changes and loading completion
    } on FirebaseException catch (error) {
      _isLoading = false;
      notifyListeners(); // Notify UI about error and loading completion
      debugPrint('Firebase error fetching products: $error');
      // ScaffoldMessenger.of(navigatorKey.currentContext!)
      //     .showSnackBar( // Show snackbar using navigator key
      //       SnackBar(
      //         content: Text('An error occurred while fetching products.'),
      //       ),
      //     );
    } catch (error) {
      _isLoading = false;
      notifyListeners(); // Notify UI about error and loading completion
      debugPrint('Unexpected error fetching products: $error');
      // ScaffoldMessenger.of(navigatorKey.currentContext!)
      //     .showSnackBar( // Show snackbar using navigator key
      //       SnackBar(
      //         content: Text('An unexpected error occurred.'),
      //       ),
      //     );
    }
  }

  void sortByPriceAscending() {
    _products.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void sortByPriceDescending() {
    _products.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  searchProducts(String searchTerm) {
    final lowercaseSearchTerm =
        searchTerm.toLowerCase(); // Make search case-insensitive
    final filteredList = products
        .where((product) =>
            product.name.toLowerCase().contains(lowercaseSearchTerm) ||
            product.category.toLowerCase().contains(lowercaseSearchTerm) ||
            product.subcategory.toLowerCase().contains(lowercaseSearchTerm) ||
            product.gender.toLowerCase().contains(lowercaseSearchTerm) ||
            product.store.toLowerCase().contains(lowercaseSearchTerm))
        .toList();
    _products.clear();
    _products.addAll(filteredList);
    notifyListeners();
  }
}
