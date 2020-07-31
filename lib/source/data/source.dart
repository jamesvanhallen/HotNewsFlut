class Source {
  final String id;
  final String description;
  final String name;

  Source(this.id, this.description, this.name);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      json['id'],
      json['description'],
      json['name'],
    );
  }
}
