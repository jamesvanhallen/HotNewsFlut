import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  final List<Source> _items = List();
  bool _loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getData();
  }

  void getData() async {
    var data = await sourceProvider.fetchSources();
    _items.clear();
    setState(() {
      _items.addAll(data);
      _loading = false;
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
        child: _loading ?
        SpinKitThreeBounce(
          color: toolbarColor,
          size: 30,
        ) :
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: SourceItem(
                _items[index],
              ),
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  '/articles',
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
