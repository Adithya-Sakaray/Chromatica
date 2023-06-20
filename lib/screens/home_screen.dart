import 'package:cached_network_image/cached_network_image.dart';
import 'package:chromatica/controller/image_controller.dart';
import 'package:chromatica/model/image_model.dart';
import 'package:chromatica/screens/profile_screen.dart';
import 'package:chromatica/screens/single_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import "";

class HomeScreen  extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ImageController imageController = Get.put(ImageController());

  var isLoaded = false;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chromatica"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child:const  Padding(
              padding:  EdgeInsets.all(10),
              child: Icon(Icons.account_circle_sharp,size: 30,),
            )
          )
        ],
      ),

      backgroundColor: Theme.of(context).colorScheme.background,

      body: SafeArea(child: AlignedLayout(context)),
    );  }

    Widget AlignedLayout(BuildContext context) {
      return  Padding(
        padding: const EdgeInsets.all(10),
        child: AlignedGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: imageController.imageList.length, 
            itemBuilder: (context,index) {
              
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleImageScreen(url: imageController.imageList[index].urls.regular,)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:  imageController.imageList[index].urls.small,
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