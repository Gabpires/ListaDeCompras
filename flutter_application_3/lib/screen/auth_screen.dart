import 'package:flutter/material.dart';
import 'package:flutter_application_3/produtos.dart';
import 'package:flutter_application_3/login.dart';
import 'package:flutter_application_3/screen/home_screen.dart';
import 'package:flutter_application_3/services/session_service.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SessionService().estalogado(), 
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return snapshot.data! ? const HomeScreen() : const Login();
      }
      );
  }
}