import 'package:flutter/material.dart';
import 'package:amazonportas/tiny_api_docsaida.dart';

// https://medium.com/@ashishpimpre/how-to-fetch-data-from-an-api-and-display-it-in-listview-in-flutter-770863f85959
// https://blog.flutterando.com.br/futurebuilder-do-jeito-certo-8ae47159cd5f
// https://codeforgeek.com/flutter-fetch-data-from-rest-api/

class DocSaida extends StatefulWidget {
  const DocSaida({super.key});

  @override
  State<DocSaida> createState() => _DocSaidaState();
}

class _DocSaidaState extends State<DocSaida> {
  final _formKey = GlobalKey<FormState>();
  final pedidoController = TextEditingController();
  late Future<String>? _codigoPedido;

  @override
  void initState() {
    super.initState();
    pedidoController.addListener(() {});
    _codigoPedido = TinyAPIDocSaida.getIdfromAPI('111');
  }

  @override
  void dispose() {
    pedidoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doc Saida'),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.only(
                left: 70,
                right: 70,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TextFormField(
                      controller: pedidoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "PVXXX",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, digite um código valido";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (builder) {
                                return const AlertDialog(
                                  content: Text(_codigoPedido ??
                                      "Retorno do código do pedido falhou"),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Algo deu errado")));
                        }
                      },
                      child: const Text("Acessar"),
                    ),
                  ],
                ),
              ))),
    );
  }
}
