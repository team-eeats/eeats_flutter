import 'package:eeats/data/dto/response/user/allergy_response.dart';
import 'package:eeats/domain/entity/user/my_entity.dart';

class MyResponse {
  final int statusCode;
  final String accountId, nickname;
  final List<AllergyResponse> allergies;

  MyResponse({
    required this.statusCode,
    required this.accountId,
    required this.nickname,
    required this.allergies,
  });

  factory MyResponse.fromJson(
    int statusCode,
    Map<String, dynamic> json,
  ) {
    return MyResponse(
      statusCode: statusCode,
      accountId: json["accountId"],
      nickname: json["nickname"],
      allergies: (json["allergies"] as List)
          .map((item) => AllergyResponse.fromJson(item))
          .toList(),
    );
  }

  MyEntity toEntity() {
    return MyEntity(
      statusCode: statusCode,
      accountId: accountId,
      nickname: nickname,
      allergies: allergies.map((allergy) => allergy.toEntity()).toList(),
    );
  }
}
