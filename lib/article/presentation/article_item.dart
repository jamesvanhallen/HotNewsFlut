import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:intl/intl.dart';

class ArticleItem extends StatelessWidget {
  final Article _article;

  ArticleItem(this._article);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          initImage(),
          initArticle(),
        ],
      ),
    );
  }

  Widget initImage() {
    return Container(
      width: 100.0,
      height: 50.0,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.00),
      child: Image.network(
        _article.urlToImage,
      ),
    );
  }

  Widget initArticle() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 8.00, bottom: 8.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              getDate(_article),
              style: kSourceItemTextStyle,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              _article.title,
              style: kSourceItemMainTextStyle,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              _article.description,
              style: kSourceItemTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  String getDate(Article article) {
    var date = DateTime.parse(article.publishedAt);
    return new DateFormat(kArticleDateFormat).format(date);
  }
}
