import 'package:eeats/domain/repository/user/user_repository.dart';

class PatchProfileUseCase {
  final UserRepository _userRepository;

  PatchProfileUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<int> execute({
    required String nickname,
  }) async =>
      await _userRepository.patchProfile(nickname: nickname);
}
