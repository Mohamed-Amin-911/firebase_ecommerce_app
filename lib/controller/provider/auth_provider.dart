import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

//signup method
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credentials.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

//login method
  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentials.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

//signout method
  Future<void> signOut(String email, String password) async {
    try {
      _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
    notifyListeners();
  }
}
