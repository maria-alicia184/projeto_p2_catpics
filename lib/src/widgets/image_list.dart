import 'package:flutter/material.dart';
import 'package:projeto_p2/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> imagens;

  ImageList(this.imagens);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagens.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          imagens[index].url,
          fit: BoxFit.cover,
          width: 1080,
          height: 809,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Erro ao carregar a imagem');
          },
        );
      },
    );
  }
}
