import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String url;

  Article(this.title, this.description, this.urlToImage, this.publishedAt,
      this.url);

  static const fromJsonFactory = _$ArticleFromJson;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
