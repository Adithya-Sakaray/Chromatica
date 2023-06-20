import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class SingleImageScreen extends StatefulWidget {
  final String url;
  
   SingleImageScreen({
    required this.url,
    super.key
    });



  @override
  State<SingleImageScreen> createState() => _SingleImageScreenState();
  

}

class _SingleImageScreenState extends State<SingleImageScreen> {
  

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.url,
                    height: 550,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}