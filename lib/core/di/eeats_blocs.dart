import 'package:eeats/presentation/vote/provider/vote_type_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<List<BlocProvider>> blocs() async {
  return [
    BlocProvider<VoteTypeControllerCubit>(create: (context) => VoteTypeControllerCubit()),
  ];
}
