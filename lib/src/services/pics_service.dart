import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_p2/src/models/image_model.dart';

Future<ImageModel> getImage() async {
  const url = "https://https://api.thecatapi.com/v1/images/search?limit=10";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return ImageModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load image');
  }
}
