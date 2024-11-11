import 'package:eeats/domain/repository/suggest/suggest_repository.dart';

class PostSuggestUseCase {
  final SuggestRepository _suggestRepository;

  PostSuggestUseCase({
    required SuggestRepository suggestRepository,
  }) : _suggestRepository = suggestRepository;

  Future<int> execute({
    required String title,
    required String content,
  }) async =>
      await _suggestRepository.postSuggest(title: title, content: content);
}
