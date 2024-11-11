import 'package:dio/dio.dart';
import 'package:eeats/core/network/dio/dio.dart';
import 'package:eeats/data/dto/response/auth/token_response.dart';
import 'package:eeats/domain/entity/auth/token_entity.dart';

class RemoteAuthDataSource {
  static const String endpoint = "/auth";

  Future<TokenEntity> signIn({
    required String accountId,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "account_id": accountId,
      "password": password,
    };
    try {
      final response = await dio.post(
        "$endpoint/user-login",
        data: data,
      );

      return TokenResponse.fromJson(response.statusCode!, response.data).toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<TokenEntity> reIssue({
    required String refreshToken,
  }) async {
    try {
      final response = await dio.put(
        "$endpoint/reissue",
        options: Options(
          headers: {
            "Refresh-Token": refreshToken,
          },
        ),
      );

      return TokenResponse.fromJson(response.statusCode!, response.data).toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
