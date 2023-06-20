import 'package:chromatica/model/image_model.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import "package:chromatica/services/remote_services.dart";

class ImageController extends GetxController {


  var imageList = <ImageModel>[].obs;
  var searchResults = [];
  var client = http.Client();
  var currentImage = <Map>[];

  @override
  void onInit() async {
    fetchImages(1);
    fetchImages(2);
    fetchImages(2);
    super.onInit();

  }

  void fetchImages(int pageNum) async {
    var images = await RemoteServices.fetchImages(pageNum);
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
