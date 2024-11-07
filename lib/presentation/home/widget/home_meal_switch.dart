import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/component/eeats_switch_button.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/type/meal_type.dart';
import 'package:flutter/material.dart';

class HomeMealSwitch extends StatelessWidget {
  final TabController controller;

  const HomeMealSwitch({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 30;
    return Stack(
      children: [
        AnimatedAlign(
          alignment: Alignment(
              MealType.values.elementAt(controller.index).offset, 0),
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
                  controller.index = index;
                },
                child: Align(
                  alignment: Alignment(controller.offset, 0),
                  child: EeatsSwitchButton(
                    width: (MediaQuery.of(context).size.width - 48) / 3,
                    height: height,
                    text: MealType.values.elementAt(index).text,
                    isSwitched: MealType.values.elementAt(controller.index) ==
                        MealType.values.elementAt(index),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
