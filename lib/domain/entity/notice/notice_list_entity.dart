import 'package:eeats/domain/entity/notice/notice_entity.dart';

class NoticeListEntity {
  final int? statusCode;
  final List<NoticeEntity>? notices;

  NoticeListEntity({
    required this.statusCode,
    required this.notices,
  });
}
