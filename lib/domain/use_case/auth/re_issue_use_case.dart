import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/domain/repository/auth/auth_repository.dart';

class ReIssueUseCase {
  final AuthRepository _authRepository;

  ReIssueUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<TokenEntity> execute({
    required String refreshToken,
  }) async => await _authRepository.reIssue(refreshToken: refreshToken);
}
