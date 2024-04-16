import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:amazonportas/second_screen.dart';

class TransitionScreen {
  static Page<dynamic> Function(BuildContext, GoRouterState) transition(
      Widget screen) {
    return (BuildContext context, GoRouterState state) {
      return CustomTransitionPage(
          child: screen,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnaminaion,
              Widget child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.bounceInOut).animate(animation),
              child: child,
            );
          });
    };
  }
}
