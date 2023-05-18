import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const MySquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
      
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(imagePath,height: 60,),
        ),
      ),
    );
  }
}