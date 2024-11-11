import 'package:eeats/data/dto/response/suggest/suggest_response.dart';
import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';

class SuggestListResponse {
  final int statusCode;
  final List<SuggestResponse> suggestions;

  SuggestListResponse({
    required this.statusCode,
    required this.suggestions,
  });

  factory SuggestListResponse.fromJson(
      int statusCode,
      Map<String, dynamic> json,
      ) {
    return SuggestListResponse(
      statusCode: statusCode,
      suggestions: (json["suggestions"] as List)
          .map((item) => SuggestResponse.fromJson(item))
          .toList(),
    );
  }

  SuggestListEntity toEntity() {
    return SuggestListEntity(
      statusCode: statusCode,
      suggestions: suggestions.map((suggestion) => suggestion.toEntity()).toList(),
    );
  }
}

