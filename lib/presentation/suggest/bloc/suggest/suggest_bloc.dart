import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/domain/use_case/suggest/get_suggest_list_use_case.dart';
import 'package:eeats/domain/use_case/suggest/post_suggest_use_case.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestBloc extends Bloc<SuggestEvent, SuggestState<SuggestListEntity>> {
  final GetSuggestListUseCase _getSuggestListUseCase;
  final PostSuggestUseCase _postSuggestUseCase;

  SuggestBloc({
    required GetSuggestListUseCase getSuggestListUseCase,
    required PostSuggestUseCase postSuggestUseCase,
  })  : _getSuggestListUseCase = getSuggestListUseCase,
        _postSuggestUseCase = postSuggestUseCase,
        super(
          Initial(
            data: SuggestListEntity(
              statusCode: null,
              suggestions: null,
            ),
          ),
        ) {
    on<GetSuggestListEvent>(_getSuggestListEventHandler);
    on<PostSuggestEvent>(_postSuggestEventHandler);
  }

  void _getSuggestListEventHandler(
    GetSuggestListEvent event,
    Emitter<SuggestState<SuggestListEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _getSuggestListUseCase.execute();

      if (response.statusCode == 200) {
        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }

  void _postSuggestEventHandler(
    PostSuggestEvent event,
    Emitter<SuggestState<SuggestListEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _postSuggestUseCase.execute(
        title: event.title,
        content: event.content,
      );

      if (response == 201) {
        final value = await _getSuggestListUseCase.execute();
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
