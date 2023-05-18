import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen  extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chromatica"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to home Screen"),
                smallGap(),
                GestureDetector(
                  onTap: signOutUser,
                  child: myButton("Sign out", context),
                )
                
              ],
            ),
          ),
        )
      ),
    );
  }
}