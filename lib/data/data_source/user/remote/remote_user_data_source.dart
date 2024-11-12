import 'package:dio/dio.dart';
import 'package:eeats/core/network/dio/dio.dart';
import 'package:eeats/core/network/dio/dio_interceptor.dart';
import 'package:eeats/core/network/secure_storage.dart';
import 'package:eeats/data/dto/request/user/allergy_request.dart';
import 'package:eeats/data/dto/request/user/profile_request.dart';
import 'package:eeats/data/dto/response/user/my_response.dart';
import 'package:eeats/domain/entity/user/my_entity.dart';

class RemoteUserDataSource {
  static const String endpoint = "/users";

  RemoteUserDataSource() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<int> patchAllergy({
    required AllergyRequest body,
  }) async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.patch(
        "$endpoint/allergy",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
        data: body,
      );

      return response.statusCode!;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<MyEntity> getMy() async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.get(
        "$endpoint/my",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      return MyResponse.fromJson(response.statusCode!, response.data)
          .toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<int> patchProfile({
    required ProfileRequest body,
  }) async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.patch(
        "$endpoint/profile",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
        data: body,
      );

      return response.statusCode!;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
