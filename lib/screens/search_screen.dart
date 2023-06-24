import "package:flutter/material.dart";

class SearchScreen  extends StatelessWidget {
  const SearchScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            
          ),
        ),
      ),
    );
  }
}