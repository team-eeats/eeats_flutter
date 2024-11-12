import 'package:eeats/domain/entity/user/allergy_entity.dart';

class MyEntity {
  final int? statusCode;
  final String? accountId, nickname;
  final List<AllergyEntity>? allergies;

  MyEntity({
    required this.statusCode,
    required this.accountId,
    required this.nickname,
    required this.allergies,
  });
}
