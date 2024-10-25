import 'package:eeats/core/state/meal_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMealControllerCubit extends Cubit<MealType> {
  HomeMealControllerCubit() : super(MealType.breakfast) {
    controller.addListener(_onPageChanged);
    init();
  }

  final PageController controller = PageController(initialPage: 0);

  void init() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;
    final minute = currentTime.minute;

    if (hour <= 8 && minute <= 30) {
      emit(MealType.breakfast);
    } else if (hour <= 13 && minute <= 30) {
      emit(MealType.lunch);
    } else if (hour <= 18 && minute <= 40){
      emit(MealType.dinner);
    }
  }

  void changeType({required MealType type}) {
    controller.animateToPage(
      type.page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    ).then((_) {
      emit(type);
    });
  }

  void _onPageChanged() {
    final index = controller.page!.round();
    emit(MealType.values.elementAt(index));
  }
}
