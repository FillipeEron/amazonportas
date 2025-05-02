import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:amazonportas/tiny_api_docsaida.dart';
import 'package:pdf/widgets.dart' as pw;
//import 'dart:io';
import 'dart:html' as web;
import 'package:web/web.dart' as web2;

class DocSaida extends StatefulWidget {
  const DocSaida({super.key});

  @override
  State<DocSaida> createState() => _DocSaidaState();
}

class _DocSaidaState extends State<DocSaida> {
  final _formKey = GlobalKey<FormState>();
  final pedidoController = TextEditingController();
  late Future<String> cliente;
  final pdf = pw.Document();

  @override
  void initState() {
    super.initState();
    pedidoController.addListener(() {});
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // código aqui
                          pdf.addPage(
                            pw.Page(
                              build: (pw.Context context) => pw.Center(
                                child: pw.Text('Hello World!'),
                              ),
                            ),
                          );

                          //final file = File('example.pdf');
                          var savedFile = await pdf.save();
                          List<int> fileInts = List.from(savedFile);
                          /*web.AnchorElement()
                            ..href =
                                "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}"
                            ..setAttribute("download",
                                "${DateTime.now().millisecondsSinceEpoch}.pdf")
                            ..click();*/
                          web2.HTMLAnchorElement()
                            ..href =
                                "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}"
                            ..setAttribute("download",
                                "${DateTime.now().millisecondsSinceEpoch}.pdf")
                            ..click();
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

  /*@override
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
  }*/
}
