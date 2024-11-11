import 'package:eeats/domain/entity/meal/meal_entity.dart';
import 'package:eeats/domain/use_case/meal/get_meal_use_case.dart';
import 'package:eeats/presentation/home/bloc/home_event.dart';
import 'package:eeats/presentation/home/bloc/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState<MealEntity>> {
  final GetMealUseCase _getMealUseCase;

  HomeBloc({
    required GetMealUseCase getMealUseCase,
  })  : _getMealUseCase = getMealUseCase,
        super(
          Initial(
            data: MealEntity(
              statusCode: null,
              breakfast: null,
              lunch: null,
              dinner: null,
            ),
          ),
        ) {
    on<GetMealEvent>(_getMealEventHandler);
  }

  void _getMealEventHandler(
    GetMealEvent event,
    Emitter<HomeState<MealEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final response = await _getMealUseCase.execute(date: event.date);

      if (response.statusCode == 200) {
        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }
}
