import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_news/shared/root.bootstrap.dart';
import 'package:hot_news/source/presentation/source_screen.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  bootsrtap();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SourceScreen(),
      navigatorKey: Get.key,
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
