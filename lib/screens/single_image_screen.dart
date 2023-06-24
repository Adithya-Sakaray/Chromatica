import 'package:cached_network_image/cached_network_image.dart';
import 'package:chromatica/components/gaps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_downloader/image_downloader.dart';
import '../components/my_alertbox.dart';

class SingleImageScreen extends StatefulWidget {
  final String smallUrl;
  final String regularUrl;

  SingleImageScreen({required this.regularUrl, required this.smallUrl, super.key});

  @override
  State<SingleImageScreen> createState() => _SingleImageScreenState();
}

class _SingleImageScreenState extends State<SingleImageScreen> {

bool isLiked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkColor();
  }


  


  void showAlertBox(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(text: text);
        });
  }

  Future<void> setWallpaper() async {
    try {
      String url = widget.regularUrl;
      int location = WallpaperManager
          .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }

  Future<void> downloadImage() async {
    var imageId = ImageDownloader.downloadImage(widget.regularUrl);
    if (imageId != null) {
      showAlertBox("Downloaded sucessfully!");
    } else {
      showAlertBox("Download failed");
    }
  }

  Future<void> addLike() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final docRef = FirebaseFirestore.instance.collection("userdata").doc(currentUser?.uid);

    final doc = await docRef.get();
    final liked_small = List<String>.from(doc.data()?['liked-small'] ?? []);
    final liked_regular = List<String>.from(doc.data()?['liked-regular'] ?? []);

  setState(() {
    isLiked = !isLiked;
  });

    if (liked_small.contains(widget.smallUrl) || liked_regular.contains(widget.regularUrl)) {
      liked_small.remove(widget.smallUrl);
      liked_regular.remove(widget.regularUrl);
    } else {
      liked_small.add(widget.smallUrl);
      liked_regular.add(widget.regularUrl);
    }
    docRef.update({
      "liked-regular": liked_regular,
      "liked-small": liked_small,
    });
  }

  Future<bool> checkColor() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final docRef = FirebaseFirestore.instance.collection("userdata").doc(currentUser?.uid);

    final doc = await docRef.get();
    final liked_small = List<String>.from(doc.data()?['liked-small'] ?? []);

    if(liked_small.contains(widget.smallUrl)){
      setState(() {
        isLiked = true;
      });
    } else {
      setState(() {
        isLiked = false;
      });
    }
     return isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: widget.regularUrl,
                  height: 550,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              smallGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (() => downloadImage()),
                    child: Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.download,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() => setWallpaper()),
                    child: Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.wallpaper,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() => addLike()),
                    child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.redAccent : Colors.white,
                        )
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
