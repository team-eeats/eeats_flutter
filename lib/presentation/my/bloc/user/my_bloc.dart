import 'package:eeats/domain/entity/user/my_entity.dart';
import 'package:eeats/domain/use_case/user/get_my_use_case.dart';
import 'package:eeats/domain/use_case/user/patch_profile_use_case.dart';
import 'package:eeats/presentation/my/bloc/user/my_event.dart';
import 'package:eeats/presentation/my/bloc/user/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBloc extends Bloc<MyEvent, MyState<MyEntity>> {
  final GetMyUseCase _getMyUseCase;
  final PatchProfileUseCase _patchProfileUseCase;

  MyBloc({
    required GetMyUseCase getMyUseCase,
    required PatchProfileUseCase patchProfileUseCase,
  })  : _getMyUseCase = getMyUseCase,
        _patchProfileUseCase = patchProfileUseCase,
        super(
          Initial(
            data: MyEntity(
              statusCode: null,
              accountId: null,
              nickname: null,
              allergies: null,
            ),
          ),
        ) {
    on<GetMyEvent>(_getMyEventHandler);
    on<PatchProfileEvent>(_patchNicknameEventHandler);
  }

  void _getMyEventHandler(
    GetMyEvent event,
    Emitter<MyState<MyEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _getMyUseCase.execute();

      if (response.statusCode == 200) {
        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }

  void _patchNicknameEventHandler(
    PatchProfileEvent event,
    Emitter<MyState<MyEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response =
          await _patchProfileUseCase.execute(nickname: event.nickname);

      if (response == 204) {
        final value = await _getMyUseCase.execute();
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
