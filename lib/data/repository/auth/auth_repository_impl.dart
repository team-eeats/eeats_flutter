import 'package:eeats/data/data_source/auth/remote/remote_auth_data_source.dart';
import 'package:eeats/domain/entity/auth/token_entity.dart';
import 'package:eeats/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;

  AuthRepositoryImpl({
    required RemoteAuthDataSource remoteAuthDataSource,
  }) : _remoteAuthDataSource = remoteAuthDataSource;

  @override
  Future<TokenEntity> signIn({
    required String accountId,
    required String password,
  }) async =>
      await _remoteAuthDataSource.signIn(
        accountId: accountId,
        password: password,
      );

  @override
  Future<TokenEntity> reIssue({
    required String refreshToken,
  }) async =>
      await _remoteAuthDataSource.reIssue(
        refreshToken: refreshToken,
      );
}
