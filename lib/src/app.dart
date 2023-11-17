import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int geraImagens = 0;

  void obterImagem() {
    var url = Uri.https(
      'api.thecatapi.com',
      '/v1/images/search',
      {'query': '5', 'page': ''},
    );
    var req = http.Request('get', url);
    req.headers.addAll({
      'Authorization': 'chave',
    });
    req.send().then((result) {
      print(result.stream);
    });
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
          onPressed: obterImagem,
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ),
        body: Text('$geraImagens'),
      ),
    );
  }
}
