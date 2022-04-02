import 'package:dev_guide/src/core/routesName.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/mainPage/mainPage.dart';
import '../presentation/pages/splash/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    ScaleTransition transitionsBuilder(
        context, animation, secondaryAnimation, child) {
      // const begin = Offset(0.0, 1.0);
      // const end = Offset.zero;
      // const curve = Curves.linear;
      //
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ),
        child: child,
      );
    }

    switch (settings.name) {
      case RoutesName.splash:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const Splash(),
        );

      case RoutesName.mainPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const MainPage(),
        );

      default:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return transitionsBuilder(
                context, animation, secondaryAnimation, child);
          },
        );
    }
  }
}
