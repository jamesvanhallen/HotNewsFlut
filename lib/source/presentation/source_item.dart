import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/source/data/source.dart';

class SourceItem extends StatelessWidget {

  final Source _source;

  SourceItem(this._source);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          initIcon(),
          initSource(),
        ],
      ),
    );
  }

  Widget initIcon() {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.00),
      child: Icon(
        Icons.book,
        color: Colors.black,
        size: 30.0,
      ),
    );
  }

  Widget initSource() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 8.00, bottom: 8.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _source.name,
              style: kSourceItemMainTextStyle,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              _source.description,
              style: kSourceItemTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
