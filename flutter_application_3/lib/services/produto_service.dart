import 'dart:convert';

import 'package:flutter_application_3/model/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoService {
  final String _baseUrl = 'https://api.liliaborges.com.br/api';

  Future<List<Produto>> listarProdutos(String token) async {
    final url = Uri.parse('$_baseUrl/produtos');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<dynamic> produtos = jsonDecode(response.body);
      return produtos.map((item) => Produto.fromJson(item)).toList();
    }

    return [];
  }
}
