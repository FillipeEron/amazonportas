import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Login();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'secondscreen',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                  child: SecondScreen(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnaminaion,
                      Widget child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.bounceInOut)
                          .animate(animation),
                      child: child,
                    );
                  });
            },
            builder: (BuildContext context, GoRouterState state) {
              return SecondScreen();
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

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              ElevatedButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () => context.go('/secondscreen'),
                  child: const Text("Acessar"))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
