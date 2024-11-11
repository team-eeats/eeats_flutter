import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/domain/use_case/suggest/get_my_suggest_use_case.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySuggestBloc
    extends Bloc<MySuggestEvent, MySuggestState<SuggestListEntity>> {
  final GetMySuggestUseCase _getMySuggestUseCase;

  MySuggestBloc({
    required GetMySuggestUseCase getMySuggestUseCase,
  })  : _getMySuggestUseCase = getMySuggestUseCase,
        super(
          Initial(
            data: SuggestListEntity(
              statusCode: null,
              suggestions: null,
            ),
          ),
        ) {
    on<GetMySuggestEvent>(_getMySuggestEventHandler);
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
}
