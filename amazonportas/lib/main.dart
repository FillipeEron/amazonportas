import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  /*runApp(const MaterialApp(
      title: "Login",
      home: Scaffold(
        body: Center(
          child: AssetImage(assetName),
        ),
      )));*/
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        body: structLogin,
      ),
    );
  }
}

final structLogin = Center(
  child: Container(
    padding: const EdgeInsets.only(
      left: 70,
      right: 70,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Image.asset("assets/amazonportas.png"),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Login",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Senha",
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20.0),
            ),
            onPressed: null,
            child: const Text("Acessar"))
      ],
    ),
  ),
);
