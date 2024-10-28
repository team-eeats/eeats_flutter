import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/vote_type.dart';
import 'package:eeats/presentation/vote/provider/vote_type_controller_cubit.dart';
import 'package:eeats/presentation/vote/widget/vote_type_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            const VoteTypeSwitch(),
            const SizedBox(height: 20),
            BlocBuilder<VoteTypeControllerCubit, VoteType>(
              builder: (context, state) {
                return Expanded(
                  child: PageView.builder(
                    controller: context.watch<VoteTypeControllerCubit>().controller,
                    itemCount: VoteType.values.length,
                    itemBuilder: (context, index) {
                      return const Placeholder();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
