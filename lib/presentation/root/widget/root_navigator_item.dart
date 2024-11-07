import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/state/navigator_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootNavigatorItem extends StatelessWidget {
  final TabController controller;
  final NavigatorType type;

  const RootNavigatorItem({
    super.key,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return EeatsGesture(
      event: () {
        if (controller.index != type.index) {
          controller.index = type.index;
        }
      },
      child: SizedBox(
        width: 94,
        height: 38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              type.icon,
              colorFilter: ColorFilter.mode(
                controller.index == type.index ? EeatsColor.main500 : EeatsColor.gray300,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              type.text,
              style: EeatsTextStyle.body4(
                color: controller.index == type.index ? EeatsColor.main500 : EeatsColor.gray300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
