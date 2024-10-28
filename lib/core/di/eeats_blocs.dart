import 'package:eeats/presentation/home/provider/home_meal_controller_cubit.dart';
import 'package:eeats/presentation/root/provider/root_navigator_cubit.dart';
import 'package:eeats/presentation/vote/provider/vote_type_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<List<BlocProvider>> blocs() async {
  return [
    BlocProvider<RootNavigatorCubit>(create: (context) => RootNavigatorCubit()),
    BlocProvider<HomeMealControllerCubit>(create: (context) => HomeMealControllerCubit()),
    BlocProvider<VoteTypeControllerCubit>(create: (context) => VoteTypeControllerCubit()),
  ];
}
