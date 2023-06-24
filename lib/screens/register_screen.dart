import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/components/my_alertbox.dart';
import 'package:chromatica/components/my_button.dart';
import 'package:chromatica/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  var isLoading = false;

  void showAlertBox(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(text: text);
        });
  }

  void registerUserWithEmail() async {
    if (_password1Controller.text == _password2Controller.text) {
      try {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _password1Controller.text,
            )
            .then((value) => {
                  FirebaseFirestore.instance
                      .collection("userdata")
                      .doc(value.user?.uid)
                      .set({
                    "name": _nameController.text,
                    "email": value.user?.email,
                    "likes": []
                  })
                });

        setState(() {
          isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showAlertBox("Password is too weak");
          setState(() {
            isLoading = false;
          });
        } else if (e.code == 'email-already-in-use') {
          showAlertBox(
            "The email is already in use!!",
          );
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        showAlertBox(e.toString());
        setState(() {
        isLoading = false;
      });
      }
    } else {
      const MyAlertBox(text: "Passwords don't match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 60,
              ),
              mediumGap(),
              const Text(
                "Hello There!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              mediumGap(),
              MyTextfield(
                  controller: _nameController,
                  hintText: "Name",
                  shouldObscureText: false),
              smallGap(),
              MyTextfield(
                  controller: _emailController,
                  hintText: "E-Mail",
                  shouldObscureText: false),
              smallGap(),
              MyTextfield(
                  controller: _password1Controller,
                  hintText: "Password",
                  shouldObscureText: true),
              smallGap(),
              MyTextfield(
                  controller: _password2Controller,
                  hintText: "Confirm Password",
                  shouldObscureText: true),
              smallGap(),
              mediumGap(),
              GestureDetector(
                  onTap: registerUserWithEmail,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : myButton("Register", context)),
              mediumGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
