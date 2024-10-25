import 'package:eeats/presentation/alarm/view/notice_screen.dart';
import 'package:eeats/presentation/root/view/root_screen.dart';
import 'package:eeats/presentation/sign_in/view/sign_in_screen.dart';
import 'package:eeats/presentation/splash/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

final eeatsRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
        path: "/splash",
        builder: (context, state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: "/signIn",
        builder: (context, state) {
          return const SignInScreen();
        }),
    GoRoute(
      path: "/root",
      builder: (context, state) {
        return const RootScreen();
      },
    ),
    GoRoute(
      path: "/alarm",
      builder: (context, state) {
        return const AlarmScreen();
      },
    ),
  ],
);
