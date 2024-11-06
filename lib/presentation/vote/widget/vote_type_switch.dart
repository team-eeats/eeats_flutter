import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/component/eeats_switch_button.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/state/vote_type.dart';
import 'package:eeats/presentation/vote/provider/vote_type_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoteTypeSwitch extends StatelessWidget {
  const VoteTypeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 38;
    return BlocBuilder<VoteTypeControllerCubit, VoteType>(
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(state.offset, 0),
              duration: const Duration(milliseconds: 150),
              child: Container(
                width: (MediaQuery.of(context).size.width - 48) / 2,
                height: height,
                decoration: BoxDecoration(
                  color: EeatsColor.main300,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: VoteType.values.length,
                itemBuilder: (context, index) {
                  return EeatsGesture(
                    event: () {
                      if (VoteType.values.elementAt(index) != state) {
                        context.read<VoteTypeControllerCubit>().changeType(type: VoteType.values.elementAt(index));
                      }
                    },
                    child: Align(
                      alignment:
                      Alignment(VoteType.values.elementAt(index).offset, 0),
                      child: EeatsSwitchButton(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        height: height,
                        text: VoteType.values.elementAt(index).text,
                        isSwitched: state == VoteType.values.elementAt(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
