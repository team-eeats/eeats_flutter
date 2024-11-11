import 'package:eeats/core/network/secure_storage.dart';
import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/domain/use_case/auth/sign_in_use_case.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:eeats/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState<TokenEntity>> {
  final SignInUseCase _signInUseCase;

  SignInBloc({
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        super(
          Initial(
            data: TokenEntity(
              statusCode: null,
              accessToken: null,
              refreshToken: null,
            ),
          ),
        ) {
    on<PostSignInEvent>(_signInEventHandler);
  }

  void _signInEventHandler(
    PostSignInEvent event,
    Emitter<SignInState<TokenEntity>> emit,
  ) async {
    try {
      emit(Loading());

      final response = await _signInUseCase.execute(
        accountId: event.accountId,
        password: event.password,
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
