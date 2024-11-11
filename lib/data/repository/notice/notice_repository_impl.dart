import 'package:eeats/data/data_source/notice/remote/remote_notice_data_source.dart';
import 'package:eeats/domain/entity/notice/notice_detail_entity.dart';
import 'package:eeats/domain/entity/notice/notice_list_entity.dart';
import 'package:eeats/domain/repository/notice/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final RemoteNoticeDataSource _remoteNoticeDataSource;

  NoticeRepositoryImpl({
    required RemoteNoticeDataSource remoteNoticeDataSource,
  }) : _remoteNoticeDataSource = remoteNoticeDataSource;

  @override
  Future<NoticeListEntity> getNoticeList() async =>
      await _remoteNoticeDataSource.getNoticeList();

  @override
  Future<NoticeDetailEntity> getNoticeDetail(
          {required String noticeId}) async =>
      await _remoteNoticeDataSource.getNoticeDetail(noticeId: noticeId);
}
