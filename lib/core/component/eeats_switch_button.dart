import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';

class EeatsSwitchButton extends StatelessWidget {
  final double height, width;
  final String text;
  final bool isSwitched;

  const EeatsSwitchButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.isSwitched,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: EeatsColor.transparent,
      alignment: Alignment.center,
      child: Text(
        text,
        style: EeatsTextStyle.label3(
          color: isSwitched ? EeatsColor.white : EeatsColor.black,
        ),
      ),
    );
  }
}
