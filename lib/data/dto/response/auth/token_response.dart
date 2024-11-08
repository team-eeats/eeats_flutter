import 'package:eeats/domain/entity/auth/token_entity.dart';

class TokenResponse {
  final int statusCode;
  final String accessToken, refreshToken;

  TokenResponse({
    required this.statusCode,
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenResponse.fromJson(
    int statusCode,
    Map<String, dynamic> json,
  ) {
    return TokenResponse(
      statusCode: statusCode,
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }

  TokenEntity toEntity() {
    return TokenEntity(
      statusCode: statusCode,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
