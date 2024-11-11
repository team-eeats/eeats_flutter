import 'package:eeats/domain/entity/notice/notice_list_entity.dart';
import 'package:eeats/domain/repository/notice/notice_repository.dart';

class GetNoticeListUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeListUseCase({
    required NoticeRepository noticeRepository,
  }) : _noticeRepository = noticeRepository;

  Future<NoticeListEntity> execute() async =>
      await _noticeRepository.getNoticeList();
}
