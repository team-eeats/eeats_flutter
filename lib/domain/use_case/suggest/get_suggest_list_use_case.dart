import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/domain/repository/suggest/suggest_repository.dart';

class GetSuggestListUseCase {
  final SuggestRepository _suggestRepository;

  GetSuggestListUseCase({
    required SuggestRepository suggestRepository,
  }) : _suggestRepository = suggestRepository;

  Future<SuggestListEntity> execute() async =>
      await _suggestRepository.getSuggestList();
}
