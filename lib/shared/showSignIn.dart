import 'package:flutter/material.dart';

class ShowSignIn with ChangeNotifier {
  bool showSignInPage = true;

  get showSignIn => showSignInPage;

  void toggleShowSignIn() {
    showSignInPage = !showSignInPage;
    notifyListeners();
  }
}