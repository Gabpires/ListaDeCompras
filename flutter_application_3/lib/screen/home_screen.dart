import 'package:flutter/material.dart';
import 'package:flutter_application_3/produtos.dart';
import 'package:flutter_application_3/screen/produtos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir para Produtos'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProdutosScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

