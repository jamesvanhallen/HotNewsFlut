import 'package:get_it/get_it.dart';
import 'package:hot_news/article/data/article_provider.dart';
import 'package:hot_news/common/navigation_service.dart';
import 'package:hot_news/common/news_api.dart';
import 'package:hot_news/source/data/source_provider.dart';

part 'root.dependencies.dart';

GetIt _registry;

void setRegistry(GetIt registry) {
  assert(registry != null);
  _registry = registry;
}