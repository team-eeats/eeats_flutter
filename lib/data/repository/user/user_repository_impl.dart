import 'package:eeats/data/data_source/user/remote/remote_user_data_source.dart';
import 'package:eeats/data/dto/request/user/allergy_request.dart';
import 'package:eeats/data/dto/request/user/profile_request.dart';
import 'package:eeats/domain/entity/user/my_entity.dart';
import 'package:eeats/domain/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteUserDataSource;

  UserRepositoryImpl({
    required RemoteUserDataSource remoteUserDataSource,
  }) : _remoteUserDataSource = remoteUserDataSource;

  @override
  Future<int> patchAllergy({required List<int> type}) async =>
      await _remoteUserDataSource.patchAllergy(
        body: AllergyRequest(type: type),
      );

  @override
  Future<MyEntity> getMy() async => await _remoteUserDataSource.getMy();

  @override
  Future<int> patchProfile({required String nickname}) async =>
      await _remoteUserDataSource.patchProfile(
        body: ProfileRequest(nickname: nickname),
      );
}
