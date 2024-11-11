import 'package:eeats/domain/repository/suggest/suggest_repository.dart';

class DeleteSuggestUseCase {
  final SuggestRepository _suggestRepository;

  DeleteSuggestUseCase({
    required SuggestRepository suggestRepository,
  }) : _suggestRepository = suggestRepository;

  Future<int> execute({
    required String uuid,
  }) async =>
      await _suggestRepository.deleteSuggest(uuid: uuid);
}
