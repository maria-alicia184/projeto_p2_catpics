class ImageModel {
  String url;

  ImageModel({required this.url});

  // Named constructor with type annotations
  ImageModel.fromJson(Map<String, dynamic> decodedJson)
      : url = decodedJson['url'] ?? '';

  @override
  String toString() {
    return 'ImageModel{url: $url}';
  }
}
