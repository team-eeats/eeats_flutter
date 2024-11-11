import 'package:eeats/core/provider/text_field_empty_cubit.dart';
import 'package:eeats/core/provider/text_field_focus_cubit.dart';
import 'package:eeats/data/data_source/auth/remote/remote_auth_data_source.dart';
import 'package:eeats/data/data_source/meal/remote/remote_meal_data_source.dart';
import 'package:eeats/data/data_source/notice/remote/remote_notice_data_source.dart';
import 'package:eeats/data/data_source/suggest/remote/remote_suggest_data_source.dart';
import 'package:eeats/data/repository/auth/auth_repository_impl.dart';
import 'package:eeats/data/repository/meal/meal_repository_impl.dart';
import 'package:eeats/data/repository/notice/notice_repository_impl.dart';
import 'package:eeats/data/repository/suggest/suggest_repository_impl.dart';
import 'package:eeats/domain/repository/auth/auth_repository.dart';
import 'package:eeats/domain/repository/meal/meal_repository.dart';
import 'package:eeats/domain/repository/notice/notice_repository.dart';
import 'package:eeats/domain/repository/suggest/suggest_repository.dart';
import 'package:eeats/domain/use_case/auth/re_issue_use_case.dart';
import 'package:eeats/domain/use_case/auth/sign_in_use_case.dart';
import 'package:eeats/domain/use_case/meal/get_meal_use_case.dart';
import 'package:eeats/domain/use_case/notice/get_notice_detail_use_case.dart';
import 'package:eeats/domain/use_case/notice/get_notice_list_use_case.dart';
import 'package:eeats/domain/use_case/suggest/get_my_suggest_use_case.dart';
import 'package:eeats/domain/use_case/suggest/get_suggest_list_use_case.dart';
import 'package:eeats/domain/use_case/suggest/post_suggest_use_case.dart';
import 'package:eeats/presentation/home/bloc/home_bloc.dart';
import 'package:eeats/presentation/my/bloc/notice/notice_bloc.dart';
import 'package:eeats/presentation/my/bloc/notice_detail/notice_detail_bloc.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:eeats/presentation/splash/bloc/splash_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/my_suggest/my_suggest_bloc.dart';
import 'package:eeats/presentation/suggest/bloc/suggest/suggest_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<List<BlocProvider>> blocs() async {
  RemoteAuthDataSource remoteAuthDataSource = RemoteAuthDataSource();
  RemoteMealDataSource remoteMealDataSource = RemoteMealDataSource();
  RemoteSuggestDataSource remoteSuggestDataSource = RemoteSuggestDataSource();
  RemoteNoticeDataSource remoteNoticeDataSource = RemoteNoticeDataSource();

  AuthRepository authRepository =
      AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource);
  MealRepository mealRepository =
      MealRepositoryImpl(remoteMealDataSource: remoteMealDataSource);
  SuggestRepository suggestRepository =
      SuggestRepositoryImpl(remoteSuggestDataSource: remoteSuggestDataSource);
  NoticeRepository noticeRepository =
      NoticeRepositoryImpl(remoteNoticeDataSource: remoteNoticeDataSource);

  SignInUseCase signInUseCase = SignInUseCase(authRepository: authRepository);
  ReIssueUseCase reIssueUseCase =
      ReIssueUseCase(authRepository: authRepository);

  GetMealUseCase getMealUseCase =
      GetMealUseCase(mealRepository: mealRepository);

  GetSuggestListUseCase getSuggestListUseCase =
      GetSuggestListUseCase(suggestRepository: suggestRepository);
  PostSuggestUseCase postSuggestUseCase =
      PostSuggestUseCase(suggestRepository: suggestRepository);
  GetMySuggestUseCase getMySuggestUseCase =
      GetMySuggestUseCase(suggestRepository: suggestRepository);

  GetNoticeListUseCase getNoticeListUseCase =
      GetNoticeListUseCase(noticeRepository: noticeRepository);
  GetNoticeDetailUseCase getNoticeDetailUseCase =
      GetNoticeDetailUseCase(noticeRepository: noticeRepository);

  return [
    BlocProvider<TextFieldFocusCubit>(
        create: (context) => TextFieldFocusCubit()),
    BlocProvider<TextFieldEmptyCubit>(
        create: (context) => TextFieldEmptyCubit()),
    BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(signInUseCase: signInUseCase)),
    BlocProvider<SplashBloc>(
        create: (context) => SplashBloc(reIssueUseCase: reIssueUseCase)),
    BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(getMealUseCase: getMealUseCase)),
    BlocProvider<SuggestBloc>(
      create: (context) => SuggestBloc(
        getSuggestListUseCase: getSuggestListUseCase,
        postSuggestUseCase: postSuggestUseCase,
      ),
    ),
    BlocProvider<NoticeBloc>(
      create: (context) => NoticeBloc(
        getNoticeListUseCase: getNoticeListUseCase,
      ),
    ),
    BlocProvider<NoticeDetailBloc>(
      create: (context) => NoticeDetailBloc(
        getNoticeDetailUseCase: getNoticeDetailUseCase,
      ),
    ),
    BlocProvider<MySuggestBloc>(
      create: (context) => MySuggestBloc(
        getMySuggestUseCase: getMySuggestUseCase,
      ),
    ),
  ];
}
