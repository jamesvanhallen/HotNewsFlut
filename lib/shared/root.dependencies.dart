part of 'root.dart';

final DependenciesProvider svc = DependenciesProvider._internal();

class DependenciesProvider {
  DependenciesProvider._internal();

  NewsApi get newsApi => _registry.get<NewsApi>();

  SourceProvider get sourceProvider => _registry.get<SourceProvider>();

  ArticleProvider get articleProvider => _registry.get<ArticleProvider>();

  NavigationService get navigationService => _registry.get<NavigationService>();
}
