import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/components/profile_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen  extends StatelessWidget {

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
  const ProfileScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text("Profile",style: TextStyle(fontSize: 25),),
        actions: [
          GestureDetector(
            onTap: () => signOutUser(),
            child: const Padding(
              padding:  EdgeInsets.all(10),
              child: Icon(Icons.logout,size: 30,),
            )
          )
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    radius: 50,
                  ),
                ),

                SizedBox(height: 20,),

                Text("Name",style:font1b()),

                SizedBox(height: 50,),

                ProfileContainer(title: "Email",text: "xyz@email.com", icon: Icons.mail,shouldShowEdit: true,),
                smallGap(),
                ProfileContainer(title: "Likes",text: "7", icon: Icons.heart_broken,shouldShowEdit: false),

              ],
            ),
          ),
        )
      ),
    );
  }
}