import 'package:flutter/material.dart';
import 'package:hot_news/mani_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final MainNavigator _navigator = MainNavigator();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kRouteMain,
      routes: _navigator.routes(),
    );
  }


}
