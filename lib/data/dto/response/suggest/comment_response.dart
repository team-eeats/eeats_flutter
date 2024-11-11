import 'package:eeats/domain/entity/suggest/comment_entity.dart';

class CommentResponse {
  final String id, content;

  CommentResponse({
    required this.id,
    required this.content,
  });

  factory CommentResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CommentResponse(
      id: json["id"],
      content: json["content"],
    );
  }

  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      content: content,
    );
  }
}
