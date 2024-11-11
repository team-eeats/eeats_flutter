import 'package:eeats/domain/entity/auth/token_entity.dart';

abstract class AuthRepository {
  Future<TokenEntity> signIn({
    required String accountId,
    required String password,
  });

  Future<TokenEntity> reIssue({
    required String refreshToken,
  });
}
