import 'package:chromatica/controller/image_controller.dart';
import 'package:chromatica/screens/home_screen.dart';
import 'package:chromatica/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'like_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int selectedIndex = 0;
  void setIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  final List <Widget> pages = [HomeScreen(),LikeScreen(),ProfileScreen()];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onTap: setIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: "Liked"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Profile")

        ],
      ),

      body: pages[selectedIndex],
    );
  }
}