import 'package:eeats/domain/entity/notice/notice_detail_entity.dart';
import 'package:eeats/domain/entity/notice/notice_list_entity.dart';

abstract class NoticeRepository {
  Future<NoticeListEntity> getNoticeList();

  Future<NoticeDetailEntity> getNoticeDetail({required String noticeId});
}
