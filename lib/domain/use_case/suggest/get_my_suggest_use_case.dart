import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/domain/repository/suggest/suggest_repository.dart';

class GetMySuggestUseCase {
  final SuggestRepository _suggestRepository;

  GetMySuggestUseCase({
    required SuggestRepository suggestRepository,
  }) : _suggestRepository = suggestRepository;

  Future<SuggestListEntity> execute() async =>
      await _suggestRepository.getMySuggest();
}
