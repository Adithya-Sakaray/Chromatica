import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/components/profile_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isLoaded = false;
  Map<String, dynamic>? userData;
  late Future<void> userDataFuture;

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    userDataFuture = retrieveUserData();
  }

  Future<void> retrieveUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final docRef = FirebaseFirestore.instance.collection("userdata").doc(currentUser?.uid);
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      setState(() {
        userData = docSnapshot.data() as Map<String, dynamic>;
        isLoaded = true;
      });
    } else {
      userData = {
        "name": "Name","email":"abc@gmail.com"
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          GestureDetector(
            onTap: () => signOutUser(),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: FutureBuilder<void>(
              future: userDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // Display a loading indicator while waiting for data
                } else if (snapshot.hasError) {
                  return Text('Error occurred while retrieving data'); // Display an error message if data retrieval fails
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          radius: 50,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(userData?["name"], style: font1b()),
                      SizedBox(height: 50),
                      if (userData != null)
                        ProfileContainer(
                          title: "Email",
                          text: userData!["email"],
                          icon: Icons.mail,
                          shouldShowEdit: true,
                        ),
                      smallGap(),
                      ProfileContainer(
                        title: "Likes",
                        text: userData!["liked-small"]?.length.toString(),
                        icon: Icons.favorite,
                        shouldShowEdit: false,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
