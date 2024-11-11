import 'package:eeats/data/data_source/meal/remote/remote_meal_data_source.dart';
import 'package:eeats/domain/entity/meal/meal_entity.dart';
import 'package:eeats/domain/repository/meal/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final RemoteMealDataSource _remoteMealDataSource;

  MealRepositoryImpl({
    required RemoteMealDataSource remoteMealDataSource,
  }) : _remoteMealDataSource = remoteMealDataSource;

  @override
  Future<MealEntity> getMeal({
    required String date,
  }) async => await _remoteMealDataSource.getMeal(date: date);
}
