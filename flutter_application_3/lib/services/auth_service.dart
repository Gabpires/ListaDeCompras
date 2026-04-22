import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_3/services/session_service.dart';

class AuthService {
  static const String _baseUrl = "https://api.liliaborges.com.br/api/auth";

  Future<String> login(String email, String senha) async {
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode({"email": email, "password": senha}),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> dados = jsonDecode(response.body);
      //Aqui vamos salvar o token com shared_preferences
      final token = dados['access_token'];
      SessionService().salvarToken(token);
      return token.toString();
    }
    return '';
  }
}
