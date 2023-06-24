import 'package:cached_network_image/cached_network_image.dart';
import 'package:chromatica/screens/single_image_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  var  liked_small = <String>[];
  var liked_regular = <String> [];
  
  @override
  void initState() {
    super.initState();
    getLikedImages();
  }

  Future<void> getLikedImages() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final docRef = FirebaseFirestore.instance.collection("userdata").doc(currentUser?.uid);

    final doc = await docRef.get();
    final localLikedSmall = List<String>.from(doc.data()?['liked-small'] ?? []);
    final localLikedRegular = List<String>.from(doc.data()?['liked-regular'] ?? []);

    setState(() {
      liked_small = localLikedSmall;
      liked_regular = localLikedRegular;
    });
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Wallpapers"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,

      body: SafeArea(child: AlignedLayout(context)),
    );
  }

  Widget AlignedLayout(BuildContext context) {
      return  Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 
            
            itemCount:liked_small.length, 
            itemBuilder: (context,index) {
              
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleImageScreen(regularUrl: liked_regular[index],smallUrl: liked_small[index])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:  liked_small[index],
                    height: 200,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          ),
      );
    }
}