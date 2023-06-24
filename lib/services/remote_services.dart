import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/image_model.dart';

class RemoteServices {

  
  


  static Future<List<ImageModel>> fetchImages(int pageNum) async {
    String accessKey = "cMloi2Zulu0j_z0PazJuXEPCEnxuofaWilWKfQbjT3k";
    var data = <ImageModel>[];
    var client = http.Client();
    var url = Uri.parse("https://api.unsplash.com/photos/?client_id=$accessKey&per_page=30&page=$pageNum&order_by=popular");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      data =  imageModelFromJson(json);
      return data;
    } else {
      return data;
    }
  }

  static Future<List> fetchSearchResults(String query)async {
    String accessKey = "cMloi2Zulu0j_z0PazJuXEPCEnxuofaWilWKfQbjT3k";
    var data = <Map>[];
    var client = http.Client();

    var url = Uri.parse("https://api.unsplash.com/search/photos?per_page=30&query=$query&client_id=$accessKey");
    var response = await client.get(url);

    if(response.statusCode == 200) {
      var json = response.body;
      data = jsonDecode(json);
      return data;
    } else {
      return data;
    }
  }

  static Future<Map> fetchSingleImage(String id) async {
    String accessKey = "cMloi2Zulu0j_z0PazJuXEPCEnxuofaWilWKfQbjT3k";
    var client = http.Client();
    var url = Uri.parse("https://api.unsplash.com/photos/$id/?client_id=$accessKey");
    var response = await client.get(url);
    if(response.statusCode == 200){
      var json = response.body;
      var data = jsonDecode(json);
      return data["urls"];
    } else {
      return { "":""};
    }
  }

}