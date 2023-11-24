import 'dart:convert';

List<ImageModel> imageFromMap(String str) =>
    List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String imageToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
  String id;
  String url;

  ImageModel({
    required this.id,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"][0],
        url: json["url"][0],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": url,
      };

  getImage() {}
}
