import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';

class EeatsOutlinedButton extends StatelessWidget {
  final double? height, width;
  final Color backgroundColor;
  final Widget content;
  final Function event;

  const EeatsOutlinedButton({
    super.key,
    required this.backgroundColor,
    required this.content,
    required this.event,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: EeatsColor.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: EeatsColor.gray0,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: EeatsGesture(
          event: () => event(),
          child: Container(
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? 43,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
