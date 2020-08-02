import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebScreen extends StatefulWidget {
  @override
  _ArticleWebScreenState createState() => _ArticleWebScreenState();
}

class _ArticleWebScreenState extends State<ArticleWebScreen> {

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context).settings.arguments;
    print('AAA ' + article.url);
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: toolbarColor,
      ),
      body: WebView(
        initialUrl: article.url,
        javascriptMode: JavascriptMode.unrestricted,
//        onWebViewCreated: (WebViewController webViewController) {
//          _controller.complete(webViewController);
//        },
      ),
    );
  }
}
