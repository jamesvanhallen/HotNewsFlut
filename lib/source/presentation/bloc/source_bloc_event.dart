import 'package:hot_news/source/data/source.dart';

abstract class SourceEvent{
  const SourceEvent();
}

class SourceRequestListEvent extends SourceEvent {}

class SourceChosenEvent extends SourceEvent {
  final Source source;

  SourceChosenEvent(this.source);
}