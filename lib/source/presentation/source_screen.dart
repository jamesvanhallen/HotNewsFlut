import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/data/source_provider.dart';
import 'package:hot_news/source/presentation/source_item.dart';

class SourceScreen extends StatefulWidget {
  @override
  _SourceScreenState createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  final sourceProvider = SourceProvider();
  final List<Source> items = List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getData();
  }

  void getData() async {
    var data = await sourceProvider.fetchSources();
    items.clear();
    setState(() {
      items.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot News'),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: SourceItem(
                items[index],
              ),
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  '/articles',
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
