import 'package:dio/dio.dart';
import 'package:eeats/core/network/dio/dio.dart';
import 'package:eeats/core/network/dio/dio_interceptor.dart';
import 'package:eeats/core/network/secure_storage.dart';
import 'package:eeats/data/dto/request/suggest/suggest_request.dart';
import 'package:eeats/data/dto/response/suggest/suggest_list_response.dart';
import 'package:eeats/domain/entity/suggest/suggest_list_entity.dart';

class RemoteSuggestDataSource {
  static const String endpoint = "/suggestions";

  RemoteSuggestDataSource() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<SuggestListEntity> getSuggestList() async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.get(
        endpoint,
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      return SuggestListResponse.fromJson(response.statusCode!, response.data)
          .toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<SuggestListEntity> getMySuggest() async {
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

      return SuggestListResponse.fromJson(response.statusCode!, response.data)
          .toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<int> postSuggest({required SuggestRequest body}) async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.post(
        endpoint,
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

  Future<int> editSuggest({
    required SuggestRequest body,
    required String uuid,
  }) async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.patch(
        "$endpoint/$uuid",
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

  Future<int> deleteSuggest({required String uuid}) async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.delete(
        "$endpoint/$uuid",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      return response.statusCode!;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
