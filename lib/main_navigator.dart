import 'package:flutter/cupertino.dart';
import 'package:hot_news/source/presentation/source_screen.dart';
import 'article/presentation/article_web_screen.dart';
import 'article/presentation/articles_screen.dart';

const kRouteMain = '/';
const kRouteArticles = '/articles';
const kRouteWebArticle = '/articleWeb';

class MainNavigator {
  Map<String, WidgetBuilder> routes() {
    return {
      kRouteMain: (context) => SourceScreen(),
      kRouteArticles: (context) => ArticleScreen(),
      kRouteWebArticle: (context) => ArticleWebScreen()
    };
  }
}