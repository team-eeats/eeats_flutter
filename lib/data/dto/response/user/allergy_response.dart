import 'package:eeats/domain/entity/user/allergy_entity.dart';

class AllergyResponse {
  final List<String> type;

  AllergyResponse({
    required this.type,
  });

  factory AllergyResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AllergyResponse(
      type: (json["type"] as List).map((item) => item as String).toList(),
    );
  }

  AllergyEntity toEntity() {
    return AllergyEntity(
      type: type,
    );
  }
}
