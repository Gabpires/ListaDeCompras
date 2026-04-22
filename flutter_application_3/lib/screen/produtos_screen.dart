import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/produto.dart';
import 'package:flutter_application_3/screen/cadastroproduto.dart';
import 'package:flutter_application_3/services/produto_service.dart';
import 'package:flutter_application_3/services/session_service.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({super.key});

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  //==============================
  final _service = ProdutoService();
  late Future<List<Produto>> _listaProdutos;

  // void initState() {
  //  super.initState();
  //  setState(() {
  //_listaProdutos = listarProdutos();
  // });
  // }

  void initState() {
    super.initState();
    setState(() {
      if (_pesquisa.text.trim().isEmpty) {
        _listaProdutos = listarProdutos();
      } else {
        _filtrarProdutos();
      }
    });
  }

  Future<List<Produto>> listarProdutos() async {
    String token = await SessionService().obterToken();
    return await _service.listarProdutos(token);
  }

  //filtrar produtos por Id
  final _pesquisa = TextEditingController();
  void _filtrarProdutos() {
    String busca = _pesquisa.text.trim().toLowerCase();
    setState(() {
      _listaProdutos = listarProdutos().then(
        (p) => p.where((produto) {
          return produto.nome.toLowerCase().contains(busca) ||
              produto.marca.toLowerCase().contains(busca);
        }).toList(),
      );
    });
  }

  //==============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
        //definir onde ela vai ser posicionada
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _pesquisa,
              decoration: InputDecoration(
                hintText: 'Pesquisar produtos...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) => _filtrarProdutos(),
              // Implementar lógica de filtragem aqu
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _listaProdutos = listarProdutos();
          });
        },
        child: FutureBuilder<List<Produto>>(
          future: _listaProdutos,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final produtos = snapshot.data!;
            if (produtos.isEmpty) {
              return Center(child: Text("Nenhum produto encontrado."));
            }

            return ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(produtos[index].nome),
                    subtitle: Text(
                      '${produtos[index].descricao} - ${produtos[index].marca}',
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.shopping_cart),
                    ), //esquerda
                    trailing: Icon(Icons.arrow_forward), //direita
                    onTap: () => {},
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a tela de cadastro de produto
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CadastroProdutoScreen()),
          );
        },
      ),
    );
  }
}
