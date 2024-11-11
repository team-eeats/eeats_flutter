abstract class NoticeDetailEvent {}

class GetNoticeDetailEvent extends NoticeDetailEvent {
  final String noticeId;

  GetNoticeDetailEvent({required this.noticeId});
}
