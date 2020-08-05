import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/data/article_provider.dart';
import 'package:hot_news/article/presentation/article_item.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/main_navigator.dart';
import 'package:hot_news/source/data/source.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final List<Article> _items = List();
  final ArticleProvider articleProvider = ArticleProvider();
  bool _loading = true;
  final GlobalKey<ScaffoldState> _articleScaffoldKey =
      new GlobalKey<ScaffoldState>();

  Source _source;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _source = ModalRoute.of(context).settings.arguments;
    getData(_source);
  }

  void getData(Source source) async {
    _items.clear();
    try {
      var data = await articleProvider.fetchArticles(
        source.id,
        kApiKey,
        source.sortBysAvailable[0],
      );

      setState(() {
        _items.addAll(data);
      });
    } catch (e) {
      _articleScaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text(e.toString())));
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _articleScaffoldKey,
      appBar: AppBar(
        title: Text(_source.name),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: _loading
            ? SpinKitThreeBounce(
                color: toolbarColor,
                size: 30,
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ArticleItem(_items[index]),
                    onTap: () => {
                      Navigator.pushNamed(
                        context,
                        kRouteWebArticle,
                        arguments: _items[index],
                      ),
                    },
                  );
                },
              ),
      ),
    );
  }
}
