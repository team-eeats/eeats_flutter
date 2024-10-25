import 'package:flutter/material.dart';

class EeatsGesture extends StatelessWidget {
  final Widget child;
  final Function event;
  final HitTestBehavior? behavior;

  const EeatsGesture({
    super.key,
    required this.child,
    required this.event,
    this.behavior = HitTestBehavior.translucent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: behavior,
      onTap: () => event(),
      child: child,
    );
  }
}
