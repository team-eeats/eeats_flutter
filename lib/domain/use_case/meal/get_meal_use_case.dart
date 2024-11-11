import 'package:eeats/domain/entity/meal/meal_entity.dart';
import 'package:eeats/domain/repository/meal/meal_repository.dart';

class GetMealUseCase {
  final MealRepository _mealRepository;

  GetMealUseCase({
    required MealRepository mealRepository,
  }) : _mealRepository = mealRepository;

  Future<MealEntity> execute({
    required String date,
  }) async => await _mealRepository.getMeal(date: date);
}
