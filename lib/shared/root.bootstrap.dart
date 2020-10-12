import 'package:get_it/get_it.dart';
import 'package:hot_news/article/data/article_provider.dart';
import 'package:hot_news/common/navigation_service.dart';
import 'package:hot_news/common/news_api.dart';
import 'package:hot_news/source/data/source_provider.dart';

import 'root.dart';

void bootsrtap() {
  final registry = GetIt.I;
  registry
      .registerLazySingleton<SourceProvider>(() => SourceProvider());
  registry
      .registerLazySingleton<ArticleProvider>(() => ArticleProvider());
  registry
      .registerLazySingleton<NavigationService>(() => NavigationService());
  registry
      .registerLazySingleton<NewsApi>(() => NewsApi.create());
  setRegistry(registry);
}