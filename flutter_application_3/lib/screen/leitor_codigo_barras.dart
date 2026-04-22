import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class LeitorCodigoBarras extends StatefulWidget {
  const LeitorCodigoBarras({super.key});

  @override
  State<LeitorCodigoBarras> createState() => _LeitorCodigoBarrasState();
}

class _LeitorCodigoBarrasState extends State<LeitorCodigoBarras> {
  bool jaLeu = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: MobileScanner(
        onDetect: (capture) {
          if(jaLeu) return;
          final codigo = capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
          final valor = codigo?.rawValue ?? '';
          jaLeu = true;
          if(valor.isEmpty) return;
          Navigator.pop(context, valor); 
        },
      ),
    );
  }
}