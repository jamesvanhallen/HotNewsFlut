import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/presentation/article_web_screen.dart';
import 'package:hot_news/article/presentation/articles_screen.dart';
import 'package:hot_news/common/pages.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/presentation/source_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = Get.key;

  Future<dynamic> navigateTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.push(route);
  }

  Future<dynamic> navigateWithReplacementTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.pushReplacement(route);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> _generateRoute(Pages page, Object arguments) {
    Widget resultPage;

    switch (page) {
      case Pages.sources:
        resultPage = SourceScreen();
        break;
      case Pages.articles:
        resultPage = ArticleScreen(arguments as Source);
        break;
      case Pages.webArticle:
        resultPage = ArticleWebScreen(arguments as Article);
        break;
      default:
        resultPage = SourceScreen();
        break;
    }

    return _getRoute(resultPage);
  }

  Route<dynamic> _getRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}