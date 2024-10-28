import 'package:eeats/core/state/navigator_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootNavigatorCubit extends Cubit<NavigatorType> {
  RootNavigatorCubit() : super(NavigatorType.home) {
    controller.addListener(_onPageChanged);
  }

  final PageController controller = PageController(initialPage: 0);

  void changeType({required NavigatorType type}) {
    controller.animateToPage(
      type.index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    ).then((_) {
      emit(type);
    });
  }

  void _onPageChanged() {
    final index = controller.page!.round();
    emit(NavigatorType.values.elementAt(index));
  }
}
