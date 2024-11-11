class TokenEntity {
  final int? statusCode;
  final String? accessToken, refreshToken;

  TokenEntity({
    required this.statusCode,
    required this.accessToken,
    required this.refreshToken,
  });
}
