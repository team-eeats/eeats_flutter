import 'package:eeats/core/constants/eeats_style.dart';

enum MealType {
  breakfast(
    text: "아침밥",
    icon: "$iconMealAsset/breakfast_icon.svg",
    offset: -1,
    page: 0,
  ),
  lunch(
    text: "점심밥",
    icon: "$iconMealAsset/lunch_icon.svg",
    offset: 0,
    page: 1,
  ),
  dinner(
    text: "저녁밥",
    icon: "$iconMealAsset/dinner_icon.svg",
    offset: 1,
    page: 2,
  );

  final String text, icon;
  final double offset;
  final int page;

  const MealType({
    required this.text,
    required this.icon,
    required this.offset,
    required this.page,
  });
}
