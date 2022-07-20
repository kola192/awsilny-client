import 'package:awsilny_client/screens/authenticate/sign_up.dart';
import 'package:awsilny_client/shared/showSignIn.dart';
import 'package:flutter/material.dart';
import 'package:awsilny_client/screens/authenticate/sign_in.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShowSignIn>(builder: (context, showSignIn, child) {
      return showSignIn.showSignInPage ? const SignIn() : const RegisterationScreen();
    });
  }
}
