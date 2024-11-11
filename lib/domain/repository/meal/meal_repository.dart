import 'package:eeats/domain/entity/meal/meal_entity.dart';

abstract class MealRepository {
  Future<MealEntity> getMeal({
    required String date,
  });
}
