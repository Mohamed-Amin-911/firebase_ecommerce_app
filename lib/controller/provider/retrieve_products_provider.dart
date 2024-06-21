// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/model/product_model.dart';
// import 'package:flutter/material.dart';

// // Assuming your product classes (Gender, Category, SubCategory, Size, Product) are defined elsewhere

// class RetrieveProductProvider extends ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   List<Product> _products = [];

//   List<Product> get products => _products;

//   Future<void> fetchProducts() async {
//     try {
//       final collectionRef = _firestore.collection('products');
//       final querySnapshot = await collectionRef.get();

//       final products = querySnapshot.docs.map((doc) {
//         final data = doc.data();
//         return Product(
//           id: data['id'],
//           name: data['name'],
//           gender: Gender.values.firstWhere(
//               (g) => g.toString().split('.').last == data['gender']),
//           image: data['image'],
//           rating: data['rating'],
//           category: Category.values.firstWhere(
//               (c) => c.toString().split('.').last == data['category']),
//           subcategory: SubCategory.values.firstWhere(
//               (s) => s.toString().split('.').last == data['subcategory']),
//           price: data['price'],
//           store: data['store'],
//           isDiscount: data['isDiscount'],
//           discountAmount: data['discountAmount'],
//           sizes: (data['sizes'] as String)
//               .split(',')
//               .map((size) => Size.values
//                   .firstWhere((s) => s.toString().split('.').last == size))
//               .toList(),
//           colors: (data['colors'] as List<dynamic>)
//               .cast<String>(), // Ensure colors are a list of strings
//           reviews: (data['reviews'] as List<dynamic>)
//               .cast<String>(), // Ensure reviews are a list of strings
//         );
//       }).toList();

//       _products = products;
//       notifyListeners(); // Notify UI about product changes
//     } on FirebaseException catch (error) {
//       debugPrint('Firebase error fetching products: $error');
//       // Optionally, show a snackbar or dialog to the user with an error message
//     } catch (error) {
//       debugPrint('Unexpected error fetching products: $error');
//       // Optionally, show a generic error message to the user
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

// Assuming your product classes (Gender, Category, SubCategory, Size, Product) are defined elsewhere

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
      notifyListeners();
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
}
