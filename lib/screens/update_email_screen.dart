import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/components/my_button.dart';
import 'package:chromatica/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_alertbox.dart';

class UpdateUserEmailScreen extends StatelessWidget {
  const UpdateUserEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final updateEmailController = TextEditingController();

     void showAlertBox(String text) {
    showDialog(context: context, builder: (context) {
      return MyAlertBox(text: text);
    });
  }

    void updateEmail () async {

      try {
        showAlertBox("Email updated sucessfully!!!");
        final currentUser =  FirebaseAuth.instance.currentUser;
        if(currentUser != null){
          currentUser.updateEmail(updateEmailController.text);
        }
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
              const Text("Please type in your new email.",textAlign: TextAlign.center,),

              mediumGap(),

              MyTextfield(controller: updateEmailController, hintText: "E-Mail", shouldObscureText: false),

              mediumGap(),

              GestureDetector(
                onTap: updateEmail,
                child: myButton("Submit", context)
              ),
            ],
          ),
        )
      ),
    );
  }
}