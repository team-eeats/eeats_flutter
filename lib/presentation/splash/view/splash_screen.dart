import 'package:eeats/core/di/eeats_asset.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => context.go("/signIn"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EeatsLayout(
      child: Center(
        child: Image.asset(
          "$imageCoreAsset/eeats_image.png",
          width: 220,
          height: 100,
        ),
      ),
    );
  }
}
