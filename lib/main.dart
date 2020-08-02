import 'package:flutter/material.dart';
import 'package:hot_news/article/presentation/article_web_screen.dart';
import 'package:hot_news/article/presentation/articles_screen.dart';
import 'package:hot_news/source/presentation/source_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => SourceScreen(),
        "/articles": (context) => ArticleScreen(),
        "/articleWeb": (context) => ArticleWebScreen()
      },
    );
  }
}
