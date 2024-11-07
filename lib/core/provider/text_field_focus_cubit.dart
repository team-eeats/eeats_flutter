import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldFocusCubit extends Cubit<bool> {
  TextFieldFocusCubit() : super(false);

  void changeValue() {
    emit(!state);
  }
}
