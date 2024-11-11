import 'package:eeats/data/data_source/suggest/remote/remote_suggest_data_source.dart';
import 'package:eeats/data/dto/request/suggest/suggest_request.dart';
import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';
import 'package:eeats/domain/repository/suggest/suggest_repository.dart';

class SuggestRepositoryImpl implements SuggestRepository {
  final RemoteSuggestDataSource _remoteSuggestDataSource;

  SuggestRepositoryImpl({
    required RemoteSuggestDataSource remoteSuggestDataSource,
  }) : _remoteSuggestDataSource = remoteSuggestDataSource;

  @override
  Future<SuggestListEntity> getSuggestList() async =>
      await _remoteSuggestDataSource.getSuggestList();

  @override
  Future<SuggestListEntity> getMySuggest() async =>
      await _remoteSuggestDataSource.getMySuggest();

  @override
  Future<int> postSuggest({
    required String title,
    required String content,
  }) async =>
      await _remoteSuggestDataSource.postSuggest(
        body: SuggestRequest(title: title, content: content),
      );

  @override
  Future<int> deleteSuggest({
    required String uuid,
  }) async =>
      await _remoteSuggestDataSource.deleteSuggest(uuid: uuid);

  @override
  Future<int> editSuggest({
    required String title,
    required String content,
    required String uuid,
  }) async =>
      await _remoteSuggestDataSource.editSuggest(
        body: SuggestRequest(title: title, content: content),
        uuid: uuid,
      );
}
