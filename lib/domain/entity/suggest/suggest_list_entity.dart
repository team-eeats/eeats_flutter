import 'package:eeats/domain/entity/suggest/suggest_entity.dart';

class SuggestListEntity {
  final int? statusCode;
  final List<SuggestEntity>? suggestions;

  SuggestListEntity({
    required this.statusCode,
    required this.suggestions,
  });
}
