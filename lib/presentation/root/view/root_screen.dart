import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/state/navigator_type.dart';
import 'package:eeats/presentation/home/view/home_screen.dart';
import 'package:eeats/presentation/root/widget/root_navigator_item.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 54,
          decoration: const BoxDecoration(
            color: EeatsColor.white,
            border: Border(
              top: BorderSide(
                width: 1,
                color: EeatsColor.gray50,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
          ),
          child: const FittedBox(
            child: Row(
              children: [
                RootNavigatorItem(type: NavigatorType.home),
                RootNavigatorItem(type: NavigatorType.suggest),
                RootNavigatorItem(type: NavigatorType.vote),
                RootNavigatorItem(type: NavigatorType.my),
              ],
            ),
          ),
        ),
      ),
      child: HomeScreen(),
    );
  }
}
