import 'package:eeats/domain/entity/user/my_entity.dart';

abstract class UserRepository {
  Future<int> patchAllergy({
    required List<int> type,
  });

  Future<MyEntity> getMy();

  Future<int> patchProfile({
    required String nickname,
  });
}
