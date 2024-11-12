import 'package:eeats/domain/repository/user/user_repository.dart';

class PatchAllergyUseCase {
  final UserRepository _userRepository;

  PatchAllergyUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<int> execute({
    required List<int> type,
  }) async =>
      _userRepository.patchAllergy(type: type);
}
