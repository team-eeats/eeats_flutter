import 'package:eeats/core/state/navigator_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootNavigatorCubit extends Cubit<NavigatorType> {
  RootNavigatorCubit() : super(NavigatorType.home);

  void changeType({
    required NavigatorType type,
  }) {
    emit(type);
  }
}
