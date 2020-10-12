import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/data/article_response.dart';
import 'package:hot_news/shared/root.dart';

class ArticleProvider {
  Future<List<Article>> fetchArticles(
    String source,
    String apiKey,
    String order,
  ) async {
    try {
      Response<ArticleResponse> response =
          await svc.newsApi.fetchArticles(source, apiKey, order);
      if (response.isSuccessful) {
        return response.body.articles;
      } else {
        throw ArgumentError(
            'cannot load currencies, code is ${response.statusCode.toString()}');
      }
    } catch (e) {
      log('error $e');
      throw ArgumentError(' cannot load currencies, cause $e');
    }
  }
}
