import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final String text;

  const MyAlertBox({
    super.key,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
          ],
        ),
      )
    );
  }
}