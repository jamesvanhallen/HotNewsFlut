import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/data/article_provider.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/source/data/source.dart';

import '../../main_navigator.dart';
import 'article_item.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final ArticleProvider articleProvider = ArticleProvider();

  Source _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _source = ModalRoute
        .of(context)
        .settings
        .arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_source.name),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Article>>(
          future: articleProvider.fetchArticles(
            _source.id,
            kApiKey,
            _source.sortBysAvailable[0],
          ),
          builder: (BuildContext context,
              AsyncSnapshot<List<Article>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SpinKitThreeBounce(
                  color: toolbarColor,
                  size: 30,
                ),
              );
            }
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text('data is empty'),
              );
            } else {
              return displayItems(snapshot.data);
            }
          },
        ),
      ),
    );
  }

  Widget displayItems(List<Article> articles) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ArticleItem(articles[index]),
          onTap: () =>
          {
            Navigator.pushNamed(
              context,
              kRouteWebArticle,
              arguments: articles[index],
            ),
          },
        );
      },
    );
  }
}
