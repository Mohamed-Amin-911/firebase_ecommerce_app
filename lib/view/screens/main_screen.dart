import 'package:ecommerce_app/model/secure_Storage_class.dart';
import 'package:ecommerce_app/view/screens/authentication_screens/login_screen.dart';
import 'package:ecommerce_app/view/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<bool> _isLoggedIn() async {
    bool? isChecked = await SecureStorage.readIsSaved("isSaved") == "saved";
    return isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data! ? const TabsScreen() : const LoginScreen();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
