import 'package:flutter/material.dart';

import 'my_small_button.dart';


class MyTextFieldBox extends StatelessWidget {

  final controller;
  VoidCallback submitButtonPressed;
  VoidCallback cancelButtonPressed;

    MyTextFieldBox ({
    super.key,
    required this.controller,
    required this.submitButtonPressed,
    required this.cancelButtonPressed
    });

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextField(
              controller:  controller,
              decoration:const  InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a Task"
              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Submit", onPressed: submitButtonPressed),
                const SizedBox(width: 10,),
                MyButton(text: "Cancel", onPressed: cancelButtonPressed),
              ],
            )

          ],
        ),
      ),
    );
  }
}