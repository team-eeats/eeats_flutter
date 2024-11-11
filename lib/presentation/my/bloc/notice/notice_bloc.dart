import 'package:eeats/domain/entity/notice/notice_list_entity.dart';
import 'package:eeats/domain/use_case/notice/get_notice_list_use_case.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_event.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState<NoticeListEntity>> {
  final GetNoticeListUseCase _getNoticeListUseCase;

  NoticeBloc({required GetNoticeListUseCase getNoticeListUseCase})
      : _getNoticeListUseCase = getNoticeListUseCase,
        super(
          Initial(
            data: NoticeListEntity(
              statusCode: null,
              notices: null,
            ),
          ),
        ) {
    on<GetNoticeEvent>(_getNoticeListEventHandler);
  }

  void _getNoticeListEventHandler(
    GetNoticeEvent event,
    Emitter<NoticeState<NoticeListEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _getNoticeListUseCase.execute();

      if (response.statusCode == 200) {
        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }
}
