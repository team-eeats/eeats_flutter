import 'package:eeats/core/di/eeats_asset.dart';
import 'package:eeats/core/layout/eeats_layout.dart';
import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/presentation/home/bloc/home_bloc.dart';
import 'package:eeats/presentation/home/bloc/home_event.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_bloc.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_event.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:eeats/presentation/splash/bloc/splash_bloc.dart';
import 'package:eeats/presentation/splash/bloc/splash_event.dart';
import 'package:eeats/presentation/splash/bloc/splash_state.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_event.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(SplashEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState<TokenEntity>>(
          listenWhen: (previous, current) =>
              current.state == SplashRemoteState.failure,
          listener: (context, SplashState<TokenEntity> state) {
            context.go("/signIn");
          },
        ),
        BlocListener<SplashBloc, SplashState<TokenEntity>>(
          listenWhen: (previous, current) =>
              current.state == SplashRemoteState.success,
          listener: (context, SplashState<TokenEntity> state) {
            context.read<SuggestBloc>().add(GetSuggestListEvent());
            context.read<MySuggestBloc>().add(GetMySuggestEvent());
            context.read<NoticeBloc>().add(GetNoticeEvent());
            context.read<HomeBloc>().add(GetMealEvent(
                date: DateFormat("yyyyMMdd").format(DateTime.now())));
            context.go("/root");
          },
        ),
      ],
      child: EeatsLayout(
        child: Center(
          child: Image.asset(
            "$imageCoreAsset/eeats_image.png",
            width: 220,
            height: 100,
          ),
        ),
      ),
    );
  }
}
