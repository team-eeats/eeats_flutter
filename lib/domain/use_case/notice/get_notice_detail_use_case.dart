import 'package:eeats/domain/entity/notice/notice_detail_entity.dart';
import 'package:eeats/domain/repository/notice/notice_repository.dart';

class GetNoticeDetailUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeDetailUseCase({
    required NoticeRepository noticeRepository,
  }) : _noticeRepository = noticeRepository;

  Future<NoticeDetailEntity> execute({required String noticeId}) async =>
      await _noticeRepository.getNoticeDetail(noticeId: noticeId);
}
