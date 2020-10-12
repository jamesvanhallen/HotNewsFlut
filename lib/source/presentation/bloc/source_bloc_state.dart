import 'package:flutter/cupertino.dart';
import 'package:hot_news/source/data/source.dart';

abstract class SourceState {
  const SourceState();
}

class SourceListLoadState extends SourceState {}

class SourceListInitialState extends SourceState {}

class SourceListSuccessState extends SourceState {
  final List<Source> sources;

  const SourceListSuccessState({@required this.sources})
      : assert(sources != null);
}

class SourceListFailureState extends SourceState {
  final String errorMessage;

  const SourceListFailureState({@required this.errorMessage})
      : assert(errorMessage != null);
}
