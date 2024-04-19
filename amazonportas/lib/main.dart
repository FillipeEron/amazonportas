import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amazonportas/doc_saida.dart';
import 'package:amazonportas/transition_screen.dart';
// https://www.freecodecamp.org/news/how-to-build-a-simple-login-app-with-flutter/

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Login();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'doc_saida',
            pageBuilder: TransitionScreen.transition(const DocSaida()),
            builder: (BuildContext context, GoRouterState state) {
              return const DocSaida();
            },
          ),
        ]),
  ],
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //loginController.addListener(() {});
    //passwordController.addListener(() {});
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Image.asset("assets/amazonportas.png"),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Login",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite um login valido";
                    }
                    return null;
                  },
                  controller: loginController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite uma senha valida";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        loginController.text == "eron" &&
                        passwordController.text == "eron123") {
                      loginController.clear();
                      passwordController.clear();
                      context.go('/doc_saida');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Acesso Negado")));
                    }
                  },
                  child: const Text("Acessar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
