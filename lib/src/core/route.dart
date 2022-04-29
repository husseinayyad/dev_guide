import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/presentation/pages/account/account.dart';
import 'package:dev_guide/src/presentation/pages/course/course.dart';
import 'package:dev_guide/src/presentation/pages/courses/courses.dart';
import 'package:dev_guide/src/presentation/pages/login/login.dart';
import 'package:dev_guide/src/presentation/pages/main_page/mainPage.dart';
import 'package:dev_guide/src/presentation/pages/signUp/sign_up.dart';
import 'package:dev_guide/src/presentation/pages/subCategory/sub_category.dart';
import 'package:dev_guide/src/presentation/pages/webView/web_view.dart';
import 'package:flutter/material.dart';


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
      case RoutesName.login:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
          const LoginPage(),
        );
      case RoutesName.signUp:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
          const SignUpPage(),
        );
      case RoutesName.subCategory:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
           SubCategoryPage(category: args["category"]),
        );
      case RoutesName.courses:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CoursesPage(subCategory:args["subCategory"]),
        );
      case RoutesName.course:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CoursePage(course:args["course"]),
        );
      case RoutesName.webView:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              WebLinkView(link:args["link"]),
        );
      case RoutesName.account:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
          const AccountPage(),
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
