import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/domain/repository/auth/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<TokenEntity> execute({
    required String accountId,
    required String password,
  }) async =>
      await _authRepository.signIn(
        accountId: accountId,
        password: password,
      );
}
