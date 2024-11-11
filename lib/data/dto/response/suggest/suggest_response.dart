import 'package:eeats/data/dto/response/suggest/comment_response.dart';
import 'package:eeats/domain/entity/suggest/suggest_entity.dart';

class SuggestResponse {
  final String id, title, content, createdAt, accountId;
  final String? userId;
  final CommentResponse? comment;

  SuggestResponse({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.accountId,
    required this.comment,
  });

  factory SuggestResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SuggestResponse(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      content: json["content"],
      createdAt: json["createdAt"],
      accountId: json["accountId"],
      comment: json["comment"] != null
          ? CommentResponse.fromJson(json["comment"])
          : null,
    );
  }

  SuggestEntity toEntity() {
    return SuggestEntity(
      id: id,
      userId: userId,
      title: title,
      content: content,
      createdAt: createdAt,
      accountId: accountId,
      comment: comment?.toEntity(),
    );
  }
}
