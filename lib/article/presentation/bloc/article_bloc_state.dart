import 'package:flutter/cupertino.dart';
import 'package:hot_news/article/data/article.dart';

abstract class ArticleState {
  const ArticleState();
}

class ArticleListLoadState extends ArticleState {}

class ArticleListInitialState extends ArticleState {}

class ArticleListSuccessState extends ArticleState {
  final List<Article> articles;

  const ArticleListSuccessState({@required this.articles})
      : assert(articles != null);
}

class ArticleListFailureState extends ArticleState {
  final String errorMessage;

  const ArticleListFailureState({@required this.errorMessage})
      : assert(errorMessage != null);
}
