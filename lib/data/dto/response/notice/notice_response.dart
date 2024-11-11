import 'package:eeats/domain/entity/notice/notice_entity.dart';

class NoticeResponse {
  final String id, title, createdAt;

  NoticeResponse({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  factory NoticeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return NoticeResponse(
      id: json["id"],
      title: json["title"],
      createdAt: json["createdAt"],
    );
  }

  NoticeEntity toEntity() {
    return NoticeEntity(
      id: id,
      title: title,
      createdAt: createdAt,
    );
  }
}
