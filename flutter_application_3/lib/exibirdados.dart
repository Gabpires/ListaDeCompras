import 'package:flutter/material.dart';

class Exibirdados extends StatefulWidget {
  String nome;
  String email;
  String senha;
  bool politica;
  bool termos;
  double slider;
  String opcao;


 Exibirdados({super.key,  this.nome = "",  this.email = "",  this.senha = 
  "", this.politica = false,  this.termos = false,  this.slider = 0, this.opcao = ""});

  @override
  State<Exibirdados> createState() => _ExibirdadosState();
}

class _ExibirdadosState extends State<Exibirdados> {
  get nome => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Recebidos", style: TextStyle(color: Colors.green, fontSize: 24)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: unnecessary_brace_in_string_interps
            Text('Nome: ${nome}')
          ]
        ),
      ),
    );
  }
}