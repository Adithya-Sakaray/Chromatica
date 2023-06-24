import 'package:flutter/material.dart';

class MySmallContainer  extends StatelessWidget {
  final String text;
  const MySmallContainer ({
    super.key,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text),
      ),
    );
  }
}