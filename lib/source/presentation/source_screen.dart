import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/main_navigator.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/data/source_provider.dart';
import 'package:hot_news/source/presentation/source_item.dart';

class SourceScreen extends StatefulWidget {
  @override
  _SourceScreenState createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  final sourceProvider = SourceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot News'),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Source>>(
          future: sourceProvider.fetchSources(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Source>> snapshot) {
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

  Widget displayItems(List<Source> sources) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: sources.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: SourceItem(
            sources[index],
          ),
          onTap: () => {
            Navigator.pushNamed(
              context,
              kRouteArticles,
              arguments: sources[index],
            ),
          },
        );
      },
    );
  }
}
