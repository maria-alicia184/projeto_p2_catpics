import 'dart:convert';

class ImageModel{
  late String url;

  ImageModel(this.url);

  ImageModel.fromJSON(Map <String, dynamic> decodedJSON){
    url = decodedJSON['id'][0];
  }
}