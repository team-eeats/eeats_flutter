import 'package:eeats/core/network/secure_storage.dart';
import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/domain/use_case/auth/re_issue_use_case.dart';
import 'package:eeats/presentation/splash/bloc/splash_event.dart';
import 'package:eeats/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState<TokenEntity>> {
  final ReIssueUseCase _reIssueUseCase;

  SplashBloc({
    required ReIssueUseCase reIssueUseCase,
  })  : _reIssueUseCase = reIssueUseCase,
        super(
          Initial(
            data: TokenEntity(
              statusCode: null,
              accessToken: null,
              refreshToken: null,
            ),
          ),
        ) {
    on<SplashEvent>(_reIssueEventHandler);
  }

  void _reIssueEventHandler(
    SplashEvent event,
    Emitter<SplashState<TokenEntity>> emit,
  ) async {
    try {
      emit(Loading(data: state.value));

      final refreshToken = await TokenSecureStorage.readRefreshToken();
      final response = await _reIssueUseCase.execute(
        refreshToken: refreshToken!,
      );

      if (response.statusCode == 200) {
        TokenSecureStorage.writeAccessToken(response.accessToken);
        TokenSecureStorage.writeRefreshToken(response.refreshToken);

        emit(Success(data: response));
      }
    } catch (err) {
      emit(Failure(message: err.toString()));
    }
  }
 }
