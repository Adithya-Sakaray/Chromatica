import 'package:chromatica/screens/home_screen.dart';
import 'package:chromatica/screens/login_or_register.dart';
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

class LoginChecker  extends StatelessWidget {
  const LoginChecker ({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomeScreen();
          }
            
          // user is NOT logged in
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
