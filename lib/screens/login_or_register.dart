import 'package:chromatica/screens/register_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class LoginOrRegisterScreen extends StatefulWidget {

 
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
   bool showLogin = true;

   void toggle(){
    setState(() {
      showLogin = !showLogin;
    });
   }

  @override
  Widget build(BuildContext context) {
    if(showLogin){
      return LoginScreen(onTap: toggle,);
    }
    else {
      return RegisterScreen(onTap: toggle,);
    }
  }
}