import 'package:eeats/domain/entity/suggest/comment_entity.dart';

class SuggestEntity {
  final String id, title, content, createdAt, accountId;
  final String? userId;
  final CommentEntity? comment;

  SuggestEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.accountId,
    required this.comment,
  });
}
