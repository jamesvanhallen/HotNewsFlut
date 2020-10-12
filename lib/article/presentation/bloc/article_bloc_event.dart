import 'package:hot_news/article/data/article.dart';

abstract class ArticleEvent {
  const ArticleEvent();
}

class ArticleRequestListEvent extends ArticleEvent {
  final String source;
  final String order;

  ArticleRequestListEvent(this.source, this.order);
}

class ArticleChosenEvent extends ArticleEvent {
  final Article article;

  ArticleChosenEvent(this.article);
}
