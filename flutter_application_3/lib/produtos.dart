import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  const Produtos({super.key});

  Widget quadroProduto({
    required String nome,
    required String preco,
    required String descricao,
    required String caminho,
    required String codigoBarras,
    required String peso,
    required String marca,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                caminho,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    descricao,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),

                  Text("Marca: $marca", style: const TextStyle(fontSize: 14)),
                  Text("Peso: $peso", style: const TextStyle(fontSize: 14)),
                  Text(
                    "Código de barras: $codigoBarras",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    preco,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> listaProdutos = [
      {
        "nome": "Arroz",
        "preco": "R\$ 25,90",
        "descricao": "Pacote de arroz branco tipo 1",
        "caminho": "assets/arroz.jpg",
        "codigoBarras": "7891234567890",
        "peso": "5kg",
        "marca": "Tio João",
      },
      {
        "nome": "Feijão",
        "preco": "R\$ 8,50",
        "descricao": "Feijão carioca premium",
        "caminho": "assets/feijao.jpg",
        "codigoBarras": "7891234567891",
        "peso": "1kg",
        "marca": "Kicaldo",
      },
      {
        "nome": "Macarrão",
        "preco": "R\$ 4,99",
        "descricao": "Macarrão espaguete",
        "caminho": "assets/macarrao.jpg",
        "codigoBarras": "7891234567892",
        "peso": "500g",
        "marca": "Renata",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Produtos"), centerTitle: true),
      body: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          final produto = listaProdutos[index];

          return quadroProduto(
            nome: produto["nome"]!,
            preco: produto["preco"]!,
            descricao: produto["descricao"]!,
            caminho: produto["caminho"]!,
            codigoBarras: produto["codigoBarras"]!,
            peso: produto["peso"]!,
            marca: produto["marca"]!,
          );
        },
      ),
    );
  }
}
