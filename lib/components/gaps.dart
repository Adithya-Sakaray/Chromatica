import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget smallGap(){
  return const SizedBox(
    height: 15,
  );
}

Widget mediumGap(){
  return const SizedBox(
    height: 40,
  );
}

Widget largeGap(){
  return const SizedBox(
    height: 70,
  );
}

TextStyle font1() {
  return  const TextStyle(
    fontSize: 16,
  );
}

TextStyle font1b() {
  return  const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}