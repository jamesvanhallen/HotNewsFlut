import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/source/data/source.dart';

class SourceItem extends StatefulWidget {
  final Source _source;

  SourceItem(this._source);

  @override
  _SourceItemState createState() => _SourceItemState();
}

class _SourceItemState extends State<SourceItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.00),
            child: Icon(
              Icons.book,
              color: Colors.black,
              size: 30.0,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8.00, bottom: 8.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget._source.name,
                    style: kSourceItemMainTextStyle,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget._source.description,
                    style: kSourceItemTextStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
