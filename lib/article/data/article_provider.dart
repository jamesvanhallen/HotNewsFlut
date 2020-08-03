import 'dart:convert';

import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:http/http.dart' as http;

class ArticleProvider {

  Future<List<Article>> fetchArticles(
    String source,
    String apiKey,
    String order,
  ) async {
    var queryParameters = {
      'source': source,
      'apiKey': apiKey,
      'order': order,
    };
    var uri = Uri.https(kEndpoint, kEndpointArticles, queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == kCode200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var sourcesJsonObj = jsonDecode(response.body)['articles'] as List;

      List<Article> sources =
          sourcesJsonObj.map((tagJson) => Article.fromJson(tagJson)).toList();
      return sources;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load articles');
    }
  }
}
