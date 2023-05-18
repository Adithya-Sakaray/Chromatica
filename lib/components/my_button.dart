import 'package:flutter/material.dart';

Widget myButton(String title,context){
  return Container(
    height: 50,
    width: 320,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12)
    ),
    child:  Center(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title),
    )),
  );
}