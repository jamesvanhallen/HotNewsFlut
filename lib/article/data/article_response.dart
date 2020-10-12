import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'article_response.g.dart';

@JsonSerializable(nullable: false)
class ArticleResponse {

  List<Article> articles;

  ArticleResponse(this.articles);

  static const fromJsonFactory = _$ArticleResponseFromJson;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
