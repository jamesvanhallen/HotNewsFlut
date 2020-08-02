import 'dart:convert';

import 'package:hot_news/constants/constants.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:http/http.dart' as http;

class SourceProvider {
  Future<List<Source>> fetchSources() async {
    var uri = Uri.https(kEndpoint, kEndpointSources);
    final response = await http.get(uri);

    if (response.statusCode == kCode200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var sourcesJsonObj = jsonDecode(response.body)['sources'] as List;

      List<Source> sources =
          sourcesJsonObj.map((tagJson) => Source.fromJson(tagJson)).toList();
      return sources;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load sources');
    }
  }
}
