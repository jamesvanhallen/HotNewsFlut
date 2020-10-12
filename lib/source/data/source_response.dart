import 'package:hot_news/source/data/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_response.g.dart';

@JsonSerializable(nullable: false)
class SourceResponse{

  List<Source> sources;

  SourceResponse(this.sources);

  static const fromJsonFactory = _$SourceResponseFromJson;

  factory SourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}