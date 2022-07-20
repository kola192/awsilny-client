import 'package:awsilny_client/screens/authenticate/authenticate.dart';
import 'package:awsilny_client/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awsilny_client/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final AuthService auth = AuthService();

    if (user != null) {
      Future check() async {
        return await auth.checkUserRole(user.uid);
      }
      dynamic currentUser = check();
      if (currentUser == null) {
        return const Authenticate();
      }
      return const HomePage();
    } else {
      return const Authenticate();
    }
  }
}
