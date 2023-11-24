import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_p2/src/models/image_model.dart';

class AppState extends State<App> {
  int currentPage = 1;
  int imagesPerPage = 5;
  List<ImageModel> imagens = [];

  Future<void> getImages() async {
    final url = Uri.https('api.thecatapi.com', 'v1/images/search',
        {'page': '$currentPage', 'limit': '${imagesPerPage * currentPage}'});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      setState(() {
        imagens = jsonList
            .take(imagesPerPage)
            .map((image) => ImageModel.fromJson(image))
            .toList();
      });
    } else {
      throw Exception('Flha ao carregar imagens');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CatPics",
            style: TextStyle(
              color: Color(0xFFB760EB),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFB760EB),
          onPressed: () {
            getImages();
            currentPage++;
          },
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: imagens.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(imagens[index].url),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}
