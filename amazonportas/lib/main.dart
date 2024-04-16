import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amazonportas/second_screen.dart';
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
          return Login();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'secondscreen',
            pageBuilder: TransitionScreen.transition(SecondScreen()),
            builder: (BuildContext context, GoRouterState state) {
              return SecondScreen();
            },
          ),
        ]),
  ],
);

/*
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
);*/

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
