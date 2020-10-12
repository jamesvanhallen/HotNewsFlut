import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hot_news/article/data/article.dart';
import 'package:hot_news/article/data/article_provider.dart';
import 'package:hot_news/common/navigation_service.dart';
import 'package:hot_news/common/pages.dart';
import 'package:hot_news/shared/root.dart';

import '../../../constants.dart';
import 'article_bloc_event.dart';
import 'article_bloc_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleProvider _articleProvider;
  NavigationService _navigationService;

  ArticleBloc() : super(ArticleListInitialState()) {
    _articleProvider = svc.articleProvider;
    _navigationService = svc.navigationService;
  }

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is ArticleRequestListEvent) {
      yield ArticleListLoadState();
      try {
        final List<Article> data = await _articleProvider.fetchArticles(
          event.source,
          kApiKey,
          event.order,
        );
        yield ArticleListSuccessState(articles: data);
      } catch (e) {
        yield ArticleListFailureState(errorMessage: e.toString());
      }
    }
    if (event is ArticleChosenEvent) {
      _navigationService.navigateTo(Pages.webArticle, arguments: event.article);
    }
  }
}
