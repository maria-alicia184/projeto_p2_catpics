class ImageModel {
  late String id;
  late String url;

  ImageModel({required this.id, required this.url});
  //named constructor
  ImageModel.fromJson(Map<String, dynamic> decodedJson) {
    id = decodedJson['id'];
    url = decodedJson['url'];
  }

  @override
  String toString() {
    return 'ImageModel{id: $id, url: $url}';
  }
}
