import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screen/home_screen.dart';
import 'package:flutter_application_3/services/auth_service.dart';
//import 'package:flutter_application_3/formulario.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_application_3/produtos.dart';
import '';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // =========== Variaveis e Login =========
  final String url = "https://api.liliaborges.com.br/api/auth/login";
  final _email = TextEditingController();
  final _senha = TextEditingController();

  Future<void> salvarToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  //Função assincrona, precisa aguardar a resposta async await
  bool _carregando = false;

  final _authService = AuthService();
  Future<void> _login() async {
    setState(() {
      //alterar estado
      _carregando = true;
    });
    final token = await _authService.login(_email.text, _senha.text);
    setState(() {
      _carregando = false;
    });
    if (token != '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email ou senha incorretos")));
    }
  }

  // =======================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "images/202502211649564487.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Entrar no super App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("email"),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _senha,
                    decoration: InputDecoration(
                      label: Text("Senha"),
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.only(bottom: 16, top: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => {_login()},
                      child: _carregando
                          ? CircularProgressIndicator()
                          : Text("Entrar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
