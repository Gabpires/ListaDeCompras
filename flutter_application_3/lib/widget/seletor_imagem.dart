import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/imagem_service.dart';

class SeletorImagem extends StatelessWidget {
  final File? imagemAtual;
  final ValueChanged<File> quandoImagemSelecionada;

  const SeletorImagem({
    super.key,
    required this.imagemAtual,
    required this.quandoImagemSelecionada,
  });

  Future<void> _abrirOpcoes(BuildContext context) async {
    final service = ImagemService();
    //selecionar imagem da galeria
    Future<void> selecionarImagemGaleria(BuildContext context) async {
      Navigator.pop(context);
      final img = await service.pegarDaGaleria();
      if (img != null) quandoImagemSelecionada(img);
    }

    //selecionar imagem da camera
    Future<void> abrirCamera(BuildContext context) async {
      Navigator.pop(context);
      final img = await service.tirarFoto();
      if (img != null) quandoImagemSelecionada(img);
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Tirar Foto"),
              onTap: () async => await abrirCamera(context),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Selecionar da Galeria"),
              onTap: () async => await selecionarImagemGaleria(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //o primeiro elemento é o fundo
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            image: imagemAtual != null
                ? DecorationImage(image: FileImage(imagemAtual!))
                : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () => _abrirOpcoes(context),
            icon: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}
