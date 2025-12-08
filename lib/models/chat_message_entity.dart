import 'package:simple_application/models/author.dart';

class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    // even though it is nullable, if u want it to be named then u gotta add it
    this.imageUrl,
    required this.text,
    required this.id,
    required this.createdAt,
    required this.author,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> jsonReponse) {
    return ChatMessageEntity(
      text: jsonReponse["text"] as String,
      id: jsonReponse["id"] as String,
      createdAt: jsonReponse["createdAt"] as int,
      author: Author.fromJson(jsonReponse["author"]),
      imageUrl: jsonReponse["imageUrl"] as String?,
    );
  }
}
