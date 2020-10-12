import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hot_news/common/navigation_service.dart';
import 'package:hot_news/common/pages.dart';
import 'package:hot_news/shared/root.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/data/source_provider.dart';
import 'package:hot_news/source/presentation/bloc/source_bloc_event.dart';
import 'package:hot_news/source/presentation/bloc/source_bloc_state.dart';

class SourceBloc extends Bloc<SourceEvent, SourceState> {
  SourceProvider _sourceProvider;
  NavigationService _navigationService;

  SourceBloc() : super(SourceListInitialState()) {
    _sourceProvider = svc.sourceProvider;
    _navigationService = svc.navigationService;
  }

  @override
  Stream<SourceState> mapEventToState(SourceEvent event) async* {
    if (event is SourceRequestListEvent) {
      yield SourceListLoadState();
      try {
        final List<Source> data = await _sourceProvider.fetchSources();
        yield SourceListSuccessState(sources: data);
      } catch (e) {
        yield SourceListFailureState(errorMessage: e.toString());
      }
    }
    if (event is SourceChosenEvent) {
      _navigationService.navigateTo(Pages.articles, arguments: event.source);
    }
  }
}
