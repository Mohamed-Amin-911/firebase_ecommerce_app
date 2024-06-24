import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

class RetrieveProductProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Product> _products = [];
  List<Product> get products => _products;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _searchedChar = "";
  String get searchedChar => _searchedChar;
  void setSearchedChar(String char) {
    _searchedChar = char;
    notifyListeners();
  }

  final List<String> _selectedColors = [];
  List<String> get selectedColors => _selectedColors;

  double _minPrice = 10;
  double _maxPrice = 1500;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;

  String _selectedSize = 'L';
  String get selectedSize => _selectedSize;
  void setSelectedSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  String _sellectedColor = '0xff020202';
  String get sellectedColor => _sellectedColor;
  void setSellectedColor(String color) {
    _sellectedColor = color;
    notifyListeners();
  }

  void setSelectedColors(String color) {
    _selectedColors.add(color);
    notifyListeners(); // Notify listeners of changes
  }

  void removeSelectedColors(String color) {
    _selectedColors.remove(color);
    notifyListeners(); // Notify listeners of changes
  }

  void setMinPrice(double price) {
    _minPrice = price;
    notifyListeners();
  }

  void setMaxPrice(double price) {
    _maxPrice = price;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      notifyListeners();

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
          sizes: data['sizes']
              .toString()
              .substring(1, data['sizes'].toString().length - 1)
              .split(', ')
              .toList(),
          colors: data['colors']
              .toString()
              .substring(1, data['colors'].toString().length - 1)
              .split(', ')
              .toList(),
          reviews: data['reviews']
              .toString()
              // .substring(1, data['reviews'].toString().length - 1)
              .split(', ')
              .toList(),
        );
      }).toList();
      notifyListeners();

      _products = products;

      notifyListeners();

      _isLoading = false;
      notifyListeners();
    } on FirebaseException catch (error) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Firebase error fetching products: $error');
      // ScaffoldMessenger.of(navigatorKey.currentContext!)
      //     .showSnackBar( // Show snackbar using navigator key
      //       SnackBar(
      //         content: Text('An error occurred while fetching products.'),
      //       ),
      //     );
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Unexpected error fetching products: $error');
      // ScaffoldMessenger.of(navigatorKey.currentContext!)
      //     .showSnackBar( // Show snackbar using navigator key
      //       SnackBar(
      //         content: Text('An unexpected error occurred.'),
      //       ),
      //     );
    }
    print(products[0].colors);
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

  void filterProducts() {
    List<Product> filteredProducts = _products
        .where((product) =>
            (_selectedColors.isEmpty ||
                _selectedColors
                    .any((color) => product.colors.contains(color))) &&
            product.price >= _minPrice &&
            product.price <= _maxPrice)
        .toList();
    _products.clear();
    _products.addAll(filteredProducts);
    notifyListeners();
  }
}
