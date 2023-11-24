import 'package:flutter/material.dart';
import 'package:projeto_p2/src/models/image_model.dart';
import 'package:projeto_p2/src/services/pics_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  String id = '9g5';
  String url = 'https://cdn2.thecatapi.com/images/9g5.jpg';
  ImageModel? data;

  void handleButtonPress() async {
    var response = await getImage();

    setState(() => data = response);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CatPics",
            style: TextStyle(
              color: Color(0xFFB760EB), // Cor #B760EB
              fontSize: 24.0, // Tamanho da fonte
              fontWeight: FontWeight.bold, // Peso da fonte (negrito)
              fontFamily: 'Roboto', // Modelo de fonte
            ),
          ),
          centerTitle: true, // Centraliza o título
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF60EBC0), // Cor do botão #60EBC0
          onPressed: handleButtonPress,
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ),
        body: Text('$data'),
      ),
    );
  }
}
