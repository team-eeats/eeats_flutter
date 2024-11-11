import 'package:eeats/domain/entity/notice/notice_entity.dart';
import 'package:eeats/presentation/alarm/view/alarm_screen.dart';
import 'package:eeats/presentation/my/view/alarm/my_alarm_screen.dart';
import 'package:eeats/presentation/my/view/edit/my_edit_allergy_screen.dart';
import 'package:eeats/presentation/my/view/edit/my_edit_nickname_screen.dart';
import 'package:eeats/presentation/my/view/notice/my_notice_detail_screen.dart';
import 'package:eeats/presentation/my/view/notice/my_notice_screen.dart';
import 'package:eeats/presentation/my/view/suggest/my_suggest_edit_screen.dart';
import 'package:eeats/presentation/my/view/suggest/my_suggest_screen.dart';
import 'package:eeats/presentation/root/view/root_screen.dart';
import 'package:eeats/presentation/sign_in/view/sign_in_screen.dart';
import 'package:eeats/presentation/splash/view/splash_screen.dart';
import 'package:eeats/presentation/suggest/view/suggest_add_screen.dart';
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
    GoRoute(
      path: "/addSuggest",
      builder: (context, state) {
        return const SuggestAddScreen();
      },
    ),
    GoRoute(
      path: "/nickname",
      builder: (context, state) {
        return const MyEditNicknameScreen();
      },
    ),
    GoRoute(
      path: "/notice",
      builder: (context, state) {
        return const MyNoticeScreen();
      },
    ),
    GoRoute(
      path: "/noticeDetail",
      builder: (context, state) {
        return MyNoticeDetailScreen(item: state.extra as NoticeEntity);
      },
    ),
    GoRoute(
      path: "/allergy",
      builder: (context, state) {
        return const MyEditAllergyScreen();
      },
    ),
    GoRoute(
      path: "/mySuggest",
      builder: (context, state) {
        return const MySuggestScreen();
      },
    ),
    GoRoute(
      path: "/editSuggest",
      builder: (context, state) {
        return const MySuggestEditScreen();
      },
    ),
    GoRoute(
      path: "/myAlarm",
      builder: (context, state) {
        return const MyAlarmScreen();
      },
    ),
  ],
);
