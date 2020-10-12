import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:hot_news/shared/root.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/data/source_response.dart';

class SourceProvider {
  Future<List<Source>> fetchSources() async {
    try {
      Response<SourceResponse> response = await svc.newsApi.fetchSources();

      if (response.isSuccessful) {
        return response.body.sources;
      } else {
        throw ArgumentError(
            ' cannot load currencies, code is ${response.statusCode.toString()}');
      }
    } catch (e) {
      log('error $e');
      throw ArgumentError(' cannot load currencies, cause $e');
    }
  }
}
