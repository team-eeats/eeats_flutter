class MealEntity {
  final int? statusCode;
  final List<String>? breakfast, lunch, dinner;

  MealEntity({
    required this.statusCode,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });
}
