import 'package:eeats/core/di/eeats_style.dart';
import 'package:flutter/material.dart';

class EeatsLayout extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? floatingActionButton, bottomSheet, bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const EeatsLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? EeatsColor.white,
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
    );
  }
}
