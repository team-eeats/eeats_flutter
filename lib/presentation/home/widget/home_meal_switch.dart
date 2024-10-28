import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/component/eeats_switch_button.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/state/meal_type.dart';
import 'package:eeats/presentation/home/provider/home_meal_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMealSwitch extends StatelessWidget {
  const HomeMealSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 30;
    return BlocBuilder<HomeMealControllerCubit, MealType>(builder: (context, state) {
      return Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(state.offset, 0),
            duration: const Duration(milliseconds: 150),
            child: Container(
              width: (MediaQuery.of(context).size.width - 48) / 3,
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
              itemCount: MealType.values.length,
              itemBuilder: (context, index) {
                return EeatsGesture(
                  event: () {
                    if (MealType.values.elementAt(index) != state) {
                      context.read<HomeMealControllerCubit>().changeType(type: MealType.values.elementAt(index));
                    }
                  },
                  child: Align(
                    alignment:
                    Alignment(MealType.values.elementAt(index).offset, 0),
                    child: EeatsSwitchButton(
                      width: (MediaQuery.of(context).size.width - 48) / 3,
                      height: height,
                      text: MealType.values.elementAt(index).text,
                      isSwitched: state == MealType.values.elementAt(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
