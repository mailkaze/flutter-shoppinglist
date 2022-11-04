import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    listenAuthState();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<void> listenAuthState() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _loggedIn = false;
      } else {
        _loggedIn = true;
      }
    });
  }
}
