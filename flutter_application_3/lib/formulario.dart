import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  // =========================================
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  // final _descricaoController = TextEditingController();

  // bool _aceitaTermos = false;
  bool _politicaPrivacidade = false;
  double _sliderNumber = 0;
  String _opcao = "";
  bool _mostrarSenha = true;

  //==========================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cabeçario do app
      appBar: AppBar(
        title: Text("formulário com validação"), //titulo do app
      ),
      body: SingleChildScrollView(
        //permite rolagem na tela

        //padding espaçamento entre  orda e o conteúdo
        child: Padding(
          padding: EdgeInsets.all(16), //espaçamento
          //formulário que vai conter todos os inputs
          child: Form(
            //alinhamento vertical
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //vários elementos
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,

                    child: Stack(
                      //caixa que permite sobreposição
                      alignment: Alignment.bottomCenter,
                      children: [
                        //vários elementos
                        CircleAvatar(
                          //foto do usuário
                          backgroundColor: Colors.grey[300],
                          radius: 60,
                          backgroundImage: AssetImage(
                            "Images/logot.png",
                          ), //imagem de fundo
                        ),
                        //container para estilizar fundo button
                        Container(
                          height: 60,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],

                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt),
                                Text("Editar"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ), //termina a ação do avatar
                  ), //caixa
                ), //Fim Imagem

                const SizedBox(height: 24), //espaçamento

                TextFormField(
                  controller: _nomeController,
                  validator: (valor) {
                    if (valor == null) {
                      return "Digite um nome válido";
                    }
                  }, //validação
                  decoration: InputDecoration(
                    labelText: "Nome",
                    prefixIcon: Icon(Icons.person),
                  ),
                ), //nome

                const SizedBox(height: 24),

                TextFormField(
                  controller: _emailController,
                  validator: (valor) {
                    if (valor == null) {
                      return "Digite um email";
                    }
                    if (valor.contains("@")) {
                      return "Email inválido";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 24),
                //campo senha
                TextFormField(
                  controller: _senhaController,
                  validator: (valor) {
                    if (valor == null) {
                      return "Digite uma senha";
                    }
                  },
                  obscureText: _mostrarSenha, //ocultar a senha
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        }),
                      },
                      icon: Icon(
                        _mostrarSenha ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),

                //textarea
                TextFormField(maxLines: 3),

                const SizedBox(height: 24),
                //   Checkbox(
                //   value: false,
                // onChanged: (valor) {
                //    setState(() {
                //  _aceitaTermos = !_aceitaTermos;
                //  });
                //  },
                //  semanticLabel: "Aceitar termos",
                //   ),
                const SizedBox(height: 24),

                CheckboxListTile(
                  title: Text("Politica de privacidade"),
                  value: _politicaPrivacidade,
                  onChanged: (valor) {
                    setState(() {
                      _politicaPrivacidade = valor!;
                    });
                  },
                ),
                const SizedBox(height: 24),

                DropdownButton(
                  items: [
                    DropdownMenuItem(value: "Turma A", child: Text("Turma A")),
                    DropdownMenuItem(value: "Turma B", child: Text("Turma B")),
                  ],
                  onChanged: (valor) {
                    setState(() {
                      _opcao = valor.toString();
                    });
                  },
                ),
                Text(_opcao),
                const SizedBox(height: 24),

                Slider(
                  value: _sliderNumber,
                  label: '$_sliderNumber',
                  min: 0,
                  max: 10,
                  divisions: 10,
                  onChanged: (valor) {
                    setState(() {
                      _sliderNumber = valor.toDouble();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
