import 'package:eeats/domain/entity/notice/notice_detail_entity.dart';
import 'package:eeats/domain/use_case/notice/get_notice_detail_use_case.dart';
import 'package:eeats/presentation/my/bloc/notice_detail/notice_detail_event.dart';
import 'package:eeats/presentation/my/bloc/notice_detail/notice_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeDetailBloc
    extends Bloc<NoticeDetailEvent, NoticeDetailState<NoticeDetailEntity>> {
  final GetNoticeDetailUseCase _getNoticeDetailUseCase;

  NoticeDetailBloc({
    required GetNoticeDetailUseCase getNoticeDetailUseCase,
  })  : _getNoticeDetailUseCase = getNoticeDetailUseCase,
        super(
          Initial(
            data: NoticeDetailEntity(
              statusCode: null,
              title: null,
              content: null,
              createdAt: null,
            ),
          ),
        ) {
    on<GetNoticeDetailEvent>(_getDetailNoticeEventHandler);
  }

  void _getDetailNoticeEventHandler(
    GetNoticeDetailEvent event,
    Emitter<NoticeDetailState<NoticeDetailEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response =
          await _getNoticeDetailUseCase.execute(noticeId: event.noticeId);

      if (response.statusCode == 200) {
        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }
}
