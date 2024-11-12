import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAllergyCubit extends Cubit<List<String>> {
  SelectAllergyCubit() : super(List.empty());

  void init({
    required List<String> values,
  }) {
    emit(values);
  }

  void selectItem({
    required String value,
  }) {
    if (state.contains(value)) {
      emit(List<String>.from(state)..remove(value));
    } else {
      emit(List<String>.from(state)..add(value));
    }
  }
}
