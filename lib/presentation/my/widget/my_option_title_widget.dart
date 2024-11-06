import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';

class MyOptionTitleWidget extends StatelessWidget {
  final String text;

  const MyOptionTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: EeatsTextStyle.body3(
          color: EeatsColor.gray600,
        ),
      ),
    );
  }
}
