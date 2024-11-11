import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/domain/use_case/suggest/edit_suggest_use_case.dart';
import 'package:eeats/domain/use_case/suggest/get_my_suggest_use_case.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySuggestBloc
    extends Bloc<MySuggestEvent, MySuggestState<SuggestListEntity>> {
  final GetMySuggestUseCase _getMySuggestUseCase;
  final EditSuggestUseCase _editSuggestUseCase;

  MySuggestBloc(
      {required GetMySuggestUseCase getMySuggestUseCase,
      required EditSuggestUseCase editSuggestUseCase})
      : _getMySuggestUseCase = getMySuggestUseCase,
        _editSuggestUseCase = editSuggestUseCase,
        super(
          Initial(
            data: SuggestListEntity(
              statusCode: null,
              suggestions: null,
            ),
          ),
        ) {
    on<GetMySuggestEvent>(_getMySuggestEventHandler);
    on<EditMySuggestEvent>(_editMySuggestEventHandler);
  }

  void _getMySuggestEventHandler(
    GetMySuggestEvent event,
    Emitter<MySuggestState<SuggestListEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _getMySuggestUseCase.execute();

      if (response.statusCode == 200) {
        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }

  void _editMySuggestEventHandler(
    EditMySuggestEvent event,
    Emitter<MySuggestState<SuggestListEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _editSuggestUseCase.execute(
        title: event.title,
        content: event.content,
        uuid: event.uuid,
      );

      if (response == 204) {
        final value = await _getMySuggestUseCase.execute();
        if (value.statusCode == 200) {
          emit(Success(data: value));
        } else {
          emit(Failure(message: response));
        }
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }
}
