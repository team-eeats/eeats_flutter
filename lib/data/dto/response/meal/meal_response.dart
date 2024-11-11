import 'package:eeats/domain/entity/meal/meal_entity.dart';

class MealResponse {
  final int statusCode;
  final List<String> breakfast, lunch, dinner;

  MealResponse({
    required this.statusCode,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  factory MealResponse.fromJson(
    int statusCode,
    Map<String, dynamic> json,
  ) {
    return MealResponse(
      statusCode: statusCode,
      breakfast: List<String>.from(json["breakfast"]),
      lunch: List<String>.from(json["lunch"]),
      dinner: List<String>.from(json["dinner"]),
    );
  }

  MealEntity toEntity() {
    return MealEntity(
      statusCode: statusCode,
      breakfast: breakfast,
      lunch: lunch,
      dinner: dinner,
    );
  }
}
