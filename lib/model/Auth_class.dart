import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
//send email verification method
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      log(e.toString());
    }
  }

//reset password method
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
    }
  }

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
  Future<void> signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }
}
