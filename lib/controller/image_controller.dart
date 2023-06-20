import 'package:chromatica/model/image_model.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import "package:chromatica/services/remote_services.dart";

class ImageController extends GetxController {


  var imageList = <ImageModel>[].obs;
  var pageindex = 0.obs;
  var searchResults = [].obs;
  var client = http.Client();
  var currentImage = <Map>[];



  void fetchImages() async {
    var images = await RemoteServices.fetchImages(pageindex);
    pageindex += 1;
    print(pageindex);
    if(images.isNotEmpty){
      imageList.addAll(images);
    }
  }

  void fetchSearchResults(String query) async {
    var images = await RemoteServices.fetchSearchResults(query);
    if(images.isNotEmpty){
      searchResults.clear();
      searchResults.addAll(images);
    }
  }

  void fetchSingleImage(String id) async {
    var image = await RemoteServices.fetchSingleImage(id);
    currentImage.add(image);
    
  }

   
}
