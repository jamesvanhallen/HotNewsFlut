import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/data/article_provider.dart';
import 'package:hot_news/article/presentation/article_item.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/source/data/source.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final List<Article> items = List();
  final ArticleProvider articleProvider = ArticleProvider();

  Source _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _source = ModalRoute.of(context).settings.arguments;
    getData(_source);
  }

  void getData(Source source) async {
    var data = await articleProvider.fetchArticles(
      source.id,
      kApiKey,
      source.sortBysAvailable[0],
    );
    items.clear();
    setState(() {
      items.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_source.name),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ArticleItem(items[index]),
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  '/articleWeb',
                  arguments: items[index],
                ),
              },
            );
          },
        ),
      ),
    );
  }
}