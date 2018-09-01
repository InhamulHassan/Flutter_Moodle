import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Root/rootPage.dart';
import 'package:moodle_app/Pages/Login/loginPage.dart';
import 'package:moodle_app/Pages/Home/homePage.dart';

Route<dynamic> routes(RouteSettings settings) {
  Route<dynamic> route;
  switch (settings.name) {
    case '/':
      route = new MyCustomRoute(
        builder: (_) => RootPage(),
        settings: settings,
      );
      break;
    case '/login':
      route = new MyCustomRoute(
        builder: (_) => LoginPage(),
        settings: settings,
      );
      break;
    case '/home':
      route = new MyCustomRoute(
        builder: (_) => HomePage(),
        settings: settings,
      );
      break;
  }
  return route;
}

//class Routes {
//  Routes(RouteSettings settings) {
//    () {
//      switch (settings.name) {
//        case '/':
//          return new MyCustomRoute(
//            builder: (_) => RootPage(),
//            settings: settings,
//          );
//        case '/login':
//          return new MyCustomRoute(
//            builder: (_) => LoginPage(),
//            settings: settings,
//          );
//      }
//    };
//  }
//}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
