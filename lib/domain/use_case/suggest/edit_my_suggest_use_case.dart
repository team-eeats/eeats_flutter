import 'package:eeats/domain/repository/suggest/suggest_repository.dart';

class EditMySuggestUseCase {
  final SuggestRepository _suggestRepository;

  EditMySuggestUseCase({
    required SuggestRepository suggestRepository,
  }) : _suggestRepository = suggestRepository;

  Future<int> execute({
    required String title,
    required String content,
    required String uuid,
  }) async =>
      await _suggestRepository.editSuggest(
        title: title,
        content: content,
        uuid: uuid,
      );
}
