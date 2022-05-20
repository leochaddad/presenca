import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {

    _auth.authStateChanges().listen((User? firebaseUser) {
      this.user = firebaseUser;
      isLoading = false;
      notifyListeners();
    });
  }

}
