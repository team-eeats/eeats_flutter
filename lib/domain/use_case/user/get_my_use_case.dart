import 'package:eeats/domain/entity/user/my_entity.dart';
import 'package:eeats/domain/repository/user/user_repository.dart';

class GetMyUseCase {
  final UserRepository _userRepository;

  GetMyUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<MyEntity> execute() async =>
      await _userRepository.getMy();
}
