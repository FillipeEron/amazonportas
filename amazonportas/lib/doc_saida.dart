import 'package:flutter/material.dart';
import 'package:amazonportas/tiny_api_docsaida.dart';

class DocSaida extends StatefulWidget {
  const DocSaida({super.key});

  @override
  State<DocSaida> createState() => _DocSaidaState();
}

class _DocSaidaState extends State<DocSaida> {
  final _formKey = GlobalKey<FormState>();
  final pedidoController = TextEditingController();
  //late Future<Info> info;
  late Future<String> cliente;

  @override
  void initState() {
    super.initState();
    pedidoController.addListener(() {});
    //cliente = getClientNameFromAPI('1000');
    //info = fetchInformation();
  }

  @override
  void dispose() {
    pedidoController.dispose();
    super.dispose();
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doc Saida'),
      ),
      body: Center(
        child: FutureBuilder(
          future: cliente,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }*/

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
                                return AlertDialog(
                                  content: FutureBuilder(
                                    future: getClientNameFromAPI(
                                        pedidoController.value.text),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(snapshot.data!);
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      return const CircularProgressIndicator();
                                    },
                                  ),
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
