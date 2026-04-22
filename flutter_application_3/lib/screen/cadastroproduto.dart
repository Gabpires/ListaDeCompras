import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_application_3/screen/leitor_codigo_barras.dart';
import 'package:flutter_application_3/widget/seletor_imagem.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  File? _imagemAtual;
  final _codigoBarrasController = TextEditingController();
  Future<void> _lerCodigoBarras() async {
    // Implementar lógica para ler código de barras aqui
    final String? resultado = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (context) => LeitorCodigoBarras()),
    );
    _codigoBarrasController.text = resultado?.isNotEmpty == true
        ? resultado!
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Produto")),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              //imagem
              SeletorImagem(
                imagemAtual: _imagemAtual,
                quandoImagemSelecionada: (img) {
                  setState(() {
                    _imagemAtual = img;
                  });
                },
              ),
              TextFormField(
                controller: _codigoBarrasController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: TextButton(
                    onPressed: _lerCodigoBarras,
                    child: Icon(Icons.qr_code_scanner),
                  ),
                  labelText: "Codigo de Barras",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Nome do Produto",
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Marca",
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Descrição",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "CategoriaId",
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField(
                onChanged: (value) => {},
                items: [
                  DropdownMenuItem(value: '1', child: Text("Laticinios")),
                  DropdownMenuItem(value: '2', child: Text("Chocolate")),
                  DropdownMenuItem(value: '3', child: Text("Merceario")),
                  DropdownMenuItem(value: '4', child: Text("Açougue")),
                ],
                initialValue: '1',
                decoration: InputDecoration(labelText: 'Categoria'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
