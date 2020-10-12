import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebScreen extends StatefulWidget {
  final Article _article;

  ArticleWebScreen(this._article);

  @override
  _ArticleWebScreenState createState() => _ArticleWebScreenState();
}

class _ArticleWebScreenState extends State<ArticleWebScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._article.title),
        backgroundColor: toolbarColor,
      ),
      body: Stack(children: <Widget>[
        WebView(
          initialUrl: widget._article.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading
            ? Center(
                child: SpinKitThreeBounce(
                  color: toolbarColor,
                  size: 30,
                ),
              )
            : Container(),
      ]),
    );
  }
}
