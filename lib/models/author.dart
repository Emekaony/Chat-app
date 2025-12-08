class Author {
  final String name;
  const Author({required this.name});

  factory Author.fromJson(Map<String, dynamic> jsonResponse) {
    return Author(name: jsonResponse["name"] as String);
  }
}
