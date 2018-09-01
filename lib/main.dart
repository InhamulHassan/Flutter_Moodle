import 'package:flutter/material.dart';
import 'package:moodle_app/Pages/Root/rootPage.dart';
import 'package:moodle_app/Pages/Login/loginPage.dart';
import 'package:moodle_app/Pages/Home/homePage.dart';
import 'package:moodle_app/navigation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Moodle App',
      theme: new ThemeData(
        // This is the theme of your application
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        accentColorBrightness: Brightness.light,
        backgroundColor: Colors.lightBlueAccent,
        buttonColor: Colors.red,
        splashColor: Colors.black12,
        primaryColor: Colors.blue,
        hintColor: Colors.white70,
        highlightColor: Colors.white10,
        cardColor: Colors.white,
      ),
      home: LoginPage(),
      onGenerateRoute: (settings) => routes(settings),
    );
  }
}
//
//(RouteSettings settings) {
//switch (settings.name) {
//case '/':
//return new MyCustomRoute(
//builder: (_) => RootPage(),
//settings: settings,
//);
//case '/login':
//return new MyCustomRoute(
//builder: (_) => LoginPage(),
//settings: settings,
//);
//}

//class MyCustomRoute<T> extends MaterialPageRoute<T> {
//  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
//      : super(builder: builder, settings: settings);
//
//  @override
//  Widget buildTransitions(BuildContext context, Animation<double> animation,
//      Animation<double> secondaryAnimation, Widget child) {
//    //if (settings.isInitialRoute) return child;
//    return new FadeTransition(opacity: animation, child: child);
//  }
//}
