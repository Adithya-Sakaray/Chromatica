import 'package:flutter/material.dart';

class MyTextfield  extends StatelessWidget {
  final controller;
  final String hintText;
  final bool shouldObscureText;

  const MyTextfield ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.shouldObscureText
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: shouldObscureText,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.background)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
        ),
      ),
    );
  }
}