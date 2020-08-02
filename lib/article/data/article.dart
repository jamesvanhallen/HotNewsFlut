class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String url;

  Article(this.title, this.description, this.urlToImage, this.publishedAt,
      this.url);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['title'],
      json['description'],
      json['urlToImage'],
      json['publishedAt'],
      json['url'],
    );
  }
}
