import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final submitted;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.submitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        onEditingComplete: submitted,
        textInputAction: TextInputAction.search,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.background ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}