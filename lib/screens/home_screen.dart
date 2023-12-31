import 'package:cached_network_image/cached_network_image.dart';
import 'package:chromatica/components/my_small_container.dart';
import 'package:chromatica/controller/image_controller.dart';
import 'package:chromatica/screens/search_screen.dart';
import 'package:chromatica/screens/single_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen  extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ImageController imageController = Get.put(ImageController());
  final ScrollController _scrollController = ScrollController();

  var isLoaded = false;  
  var pageNum = 0;

  
  @override
  void initState() {
    super.initState();
    // Attach scroll listener when the widget is initialized
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Dispose the scroll controller to avoid memory leaks
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      // User reached the end of the list
      // Append more data to the list here
      if(!isLoaded){
        fetchMoreData();
      }
      
    }
  }

  Future<void> fetchMoreData() async {
    if (!isLoaded) {
      setState(() {
        pageNum += 1;
        isLoaded = true;
        imageController.fetchImages(pageNum);
      });
       
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    imageController.fetchImages(pageNum);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chromatica"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child:const  Padding(
              padding:  EdgeInsets.all(10),
              child: Icon(Icons.search,size: 30,),
            )
          )
        ],
      ),

      backgroundColor: Theme.of(context).colorScheme.background,

      body: SafeArea(child: Obx( () =>  AlignedLayout(context))),
    );  }

    // ignore: non_constant_identifier_names
    Widget AlignedLayout(BuildContext context) {
      return  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //       SizedBox(width: 10,),
            //       MySmallContainer(text: "Home"),
            //     ],
            //   ),
            // ),
            //SizedBox(height: 10,),
            Expanded(
              child: Container(
                child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.60,
                ), 
                    
                    itemCount: imageController.imageList.length, 
                    itemBuilder: (context,index) {
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleImageScreen(regularUrl: imageController.imageList[index].urls.regular,smallUrl: imageController.imageList[index].urls.small,)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:  imageController.imageList[index].urls.small,
                            height: 280,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                            key: UniqueKey(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  ),
              ),
            ),
          ],
        ),
      );
    }
}