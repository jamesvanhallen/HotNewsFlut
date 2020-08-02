import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:intl/intl.dart';

class ArticleItem extends StatefulWidget {
  final Article _article;

  ArticleItem(this._article);

  @override
  _SourceItemState createState() => _SourceItemState();
}

class _SourceItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 50.0,
            margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.00),
            child: Image.network(
              widget._article.urlToImage,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8.00, bottom: 8.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    getDate(),
                    style: kSourceItemTextStyle,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget._article.title,
                    style: kSourceItemMainTextStyle,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget._article.description,
                    style: kSourceItemTextStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String getDate() {
    var date = DateTime.parse(widget._article.publishedAt);
    return new DateFormat(kArticleDateFormat).format(date);
  }
}