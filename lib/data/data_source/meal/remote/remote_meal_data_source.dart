import 'package:eeats/core/network/dio/dio.dart';
import 'package:eeats/core/network/dio/dio_interceptor.dart';
import 'package:eeats/data/dto/response/meal/meal_response.dart';
import 'package:eeats/domain/entity/meal/meal_entity.dart';

class RemoteMealDataSource {
  static const String endpoint = "/meals";

  RemoteMealDataSource() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<MealEntity> getMeal({
    required String date,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: {"date": "20241108"},
      );

      return MealResponse.fromJson(response.statusCode!, response.data).toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
