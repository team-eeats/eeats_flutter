import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/type/help_guide_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOptionContentWidget extends StatelessWidget {
  final HelpGuideType type;
  final Function event;

  const MyOptionContentWidget({
    super.key,
    required this.type,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return EeatsGesture(
      event: () => event(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              type.icon,
              colorFilter: const ColorFilter.mode(
                EeatsColor.main300,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              type.text,
              style: EeatsTextStyle.body2(
                color: EeatsColor.gray800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
