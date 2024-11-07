import 'package:eeats/core/type/vote_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoteTypeControllerCubit extends Cubit<VoteType> {
  VoteTypeControllerCubit() : super(VoteType.open) {
    controller.addListener(_onPageChanged);
  }

  final PageController controller = PageController(initialPage: 0);

  void changeType({required VoteType type}) {
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
    emit(VoteType.values.elementAt(index));
  }
}
