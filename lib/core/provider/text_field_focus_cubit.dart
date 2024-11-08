import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldFocusCubit extends Cubit<bool> {
  TextFieldFocusCubit() : super(false);

  void changeFocus() {
    emit(true);
  }

  void changeUnFocus() {
    emit(false);
  }
}
