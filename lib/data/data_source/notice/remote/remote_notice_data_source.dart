import 'package:dio/dio.dart';
import 'package:eeats/core/network/dio/dio.dart';
import 'package:eeats/core/network/dio/dio_interceptor.dart';
import 'package:eeats/core/network/secure_storage.dart';
import 'package:eeats/data/dto/response/notice/notice_detail_response.dart';
import 'package:eeats/data/dto/response/notice/notice_list_response.dart';
import 'package:eeats/domain/entity/notice/notice_detail_entity.dart';
import 'package:eeats/domain/entity/notice/notice_list_entity.dart';

class RemoteNoticeDataSource {
  static const String endpoint = "/notices";

  RemoteNoticeDataSource() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<NoticeListEntity> getNoticeList() async {
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

      return NoticeListResponse.fromJson(response.statusCode!, response.data)
          .toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<NoticeDetailEntity> getNoticeDetail({required String noticeId}) async {
    try {
      final accessToken = await TokenSecureStorage.readAccessToken();

      final response = await dio.get(
        "$endpoint/details/$noticeId",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      return NoticeDetailResponse.fromJson(response.statusCode!, response.data)
          .toEntity();
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
