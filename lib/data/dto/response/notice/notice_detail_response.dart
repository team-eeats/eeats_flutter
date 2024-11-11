import 'package:eeats/domain/entity/notice/notice_detail_entity.dart';

class NoticeDetailResponse {
  final int statusCode;
  final String title, content, createdAt;

  NoticeDetailResponse({
    required this.statusCode,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NoticeDetailResponse.fromJson(
    int statusCode,
    Map<String, dynamic> json,
  ) {
    return NoticeDetailResponse(
      statusCode: statusCode,
      title: json["title"],
      content: json["content"],
      createdAt: json["createdAt"],
    );
  }

  NoticeDetailEntity toEntity() {
    return NoticeDetailEntity(
      statusCode: statusCode,
      title: title,
      content: content,
      createdAt: createdAt,
    );
  }
}
