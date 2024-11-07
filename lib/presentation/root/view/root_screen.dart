import 'package:eeats/core/component/eeats_app_bar.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/core/type/navigator_type.dart';
import 'package:eeats/presentation/home/view/home_screen.dart';
import 'package:eeats/presentation/my/view/my_screen.dart';
import 'package:eeats/presentation/root/widget/root_navigator_item.dart';
import 'package:eeats/presentation/suggest/view/suggest_screen.dart';
import 'package:eeats/presentation/vote/view/vote_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: NavigatorType.values.length, vsync: this);
    _controller.animation!.addListener(() {
      int index = _controller.index + _controller.offset.round();

      setState(() {
        _controller.index = index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const SuggestScreen(),
    const VoteScreen(),
    const MyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      appBar: const EeatsAppBar(),
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
          child: FittedBox(
            child: Row(
              children: [
                RootNavigatorItem(
                  type: NavigatorType.home,
                  controller: _controller,
                ),
                RootNavigatorItem(
                  type: NavigatorType.suggest,
                  controller: _controller,
                ),
                RootNavigatorItem(
                  type: NavigatorType.vote,
                  controller: _controller,
                ),
                RootNavigatorItem(
                  type: NavigatorType.my,
                  controller: _controller,
                ),
              ],
            ),
          ),
        ),
      ),
      child: TabBarView(
        controller: _controller,
        children: NavigatorType.values
            .map((type) => pages.elementAt(type.index))
            .toList(),
      ),
    );
  }
}
