import 'package:chopper/chopper.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/data/article_response.dart';
import 'package:hot_news/shared/json_serializable_converter.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/data/source_response.dart';

import '../constants.dart';

part 'news_api.chopper.dart';

@ChopperApi()
abstract class NewsApi extends ChopperService {

  @Get(path: '/sources')
  Future<Response<SourceResponse>> fetchSources();

  @Get(path: '/articles')
  Future<Response<ArticleResponse>> fetchArticles(
    @Query('source') String source,
    @Query('apiKey') String apiKey,
    @Query('order') String order,
  );

  static NewsApi create() {
    final client = ChopperClient(
      baseUrl: kEndpoint,
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonSerializableConverter(
        factories: {
          Source: Source.fromJsonFactory,
          Article: Article.fromJsonFactory,
          SourceResponse: SourceResponse.fromJsonFactory,
          ArticleResponse: ArticleResponse.fromJsonFactory,
        },
      ),
      services: [
        _$NewsApi(),
      ],
    );
    return _$NewsApi(client);
  }
}
