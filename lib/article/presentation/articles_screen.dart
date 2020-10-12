import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/presentation/bloc/article_bloc.dart';
import 'package:hot_news/article/presentation/bloc/article_bloc_state.dart';
import 'package:hot_news/constants.dart';
import 'package:hot_news/source/data/source.dart';

import 'article_item.dart';
import 'bloc/article_bloc_event.dart';

class ArticleScreen extends StatefulWidget {
  final Source _source;

  ArticleScreen(this._source);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._source.name),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (_) => ArticleBloc()
          ..add(
            ArticleRequestListEvent(
              widget._source.id,
              widget._source.sortBysAvailable[0],
            ),
          ),
        child:
            BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
          if (state is ArticleListSuccessState) {
            return displayItems(state.articles);
          }
          if (state is ArticleListFailureState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Center(
            child: SpinKitThreeBounce(
              color: toolbarColor,
              size: 30,
            ),
          );
        }),
      )),
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
          onTap: () => {
            context
                .bloc<ArticleBloc>()
                .add(ArticleChosenEvent(articles[index])),
          },
        );
      },
    );
  }
}
