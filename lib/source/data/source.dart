import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable(nullable: false)
class Source {
  final String id;
  final String description;
  final String name;
  final dynamic sortBysAvailable;

  Source(this.id, this.description, this.name, this.sortBysAvailable);

  static const fromJsonFactory = _$SourceFromJson;

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
