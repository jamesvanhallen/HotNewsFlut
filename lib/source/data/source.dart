class Source {
  final String id;
  final String description;
  final String name;
  final dynamic sortBysAvailable;

  Source(this.id, this.description, this.name, this.sortBysAvailable);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      json['id'],
      json['description'],
      json['name'],
      json['sortBysAvailable'],
    );
  }
}
