import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';

abstract class SuggestRepository {
  Future<SuggestListEntity> getSuggestList();

  Future<SuggestListEntity> getMySuggest();

  Future<int> postSuggest({
    required String title,
    required String content,
  });

  Future<int> editSuggest({
    required String title,
    required String content,
    required String uuid,
  });

  Future<int> deleteSuggest({
    required String uuid,
  });
}
