import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/components/my_button.dart';
import 'package:chromatica/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_alertbox.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final forgotEmailController = TextEditingController();

     void showAlertBox(String text) {
    showDialog(context: context, builder: (context) {
      return MyAlertBox(text: text);
    });
  }

    void sendResetEmail () async {

      try {
        showAlertBox("Password reset link sent to your email sucessfully!");
       await FirebaseAuth.instance
    .sendPasswordResetEmail(email: forgotEmailController.text);
        Navigator.pop(context);
      } catch (e) {
        showAlertBox(e.toString());
      }
      
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Please type in your email, we will send you a reset link",textAlign: TextAlign.center,),

              mediumGap(),

              MyTextfield(controller: forgotEmailController, hintText: "E-Mail", shouldObscureText: false),

              mediumGap(),

              GestureDetector(
                onTap: sendResetEmail,
                child: myButton("Submit", context)
              ),
            ],
          ),
        )
      ),
    );
  }
}