import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldEmptyCubit extends Cubit<bool> {
  TextFieldEmptyCubit() : super(false);

  void changeFill() {
    emit(true);
  }

  void changeEmpty() {
    emit(false);
  }
}
