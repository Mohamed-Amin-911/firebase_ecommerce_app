import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SuccessLogInRovider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> isLogged(String isLoggedIn) async {
    await _storage.write(key: 'isLoggedIn', value: isLoggedIn);

    notifyListeners();
  }

  Future<String> isLoggedRead(String isLoggedIn) async {
    String? res = await _storage.read(key: 'isLoggedIn');
    return res!;
  }
}
