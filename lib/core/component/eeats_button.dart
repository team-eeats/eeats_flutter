import 'package:eeats/core/component/eeats_gesture.dart';
import 'package:eeats/core/constants/eeats_style.dart';
import 'package:flutter/material.dart';

class EeatsButton extends StatelessWidget {
  final Color backgroundColor;
  final Widget content;
  final Function event;
  final double? height, width, radius;
  final bool? hasPadding;

  const EeatsButton({
    super.key,
    required this.backgroundColor,
    required this.content,
    required this.event,
    this.height,
    this.width,
    this.radius,
    this.hasPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hasPadding! ? 24 : 0),
      child: EeatsGesture(
        event: () => event(),
        child: Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          child: content,
        ),
      ),
    );
  }
}
