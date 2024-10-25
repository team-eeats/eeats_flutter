import 'package:eeats/core/constants/eeats_asset.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/presentation/home/provider/home_meal_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeMealControllerCubit>().init();
    });
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
