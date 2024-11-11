import 'package:eeats/data/dto/response/notice/notice_response.dart';
import 'package:eeats/domain/entity/notice/notice_list_entity.dart';

class NoticeListResponse {
  final int statusCode;
  final List<NoticeResponse> notices;

  NoticeListResponse({
    required this.statusCode,
    required this.notices,
  });

  factory NoticeListResponse.fromJson(
    int statusCode,
    Map<String, dynamic> json,
  ) {
    return NoticeListResponse(
      statusCode: statusCode,
      notices: (json["notices"] as List)
          .map((item) => NoticeResponse.fromJson(item))
          .toList(),
    );
  }

  NoticeListEntity toEntity() {
    return NoticeListEntity(
      statusCode: statusCode,
      notices: notices.map((notice) => notice.toEntity()).toList(),
    );
  }
}
