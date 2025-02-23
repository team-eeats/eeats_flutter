import 'package:dio/dio.dart';
import 'package:eeats/core/network/dio/dio.dart' as network;
import 'package:eeats/core/network/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;

class DioInterceptor extends Interceptor {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('[REQ] [${options.method}] ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri} ${err.response!.statusCode}');

    final refreshToken = await storage.read(key: refreshTokenKey);

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/reissue';

    if (isStatus401 && !isPathRefresh) {
      try {
        final response = await network.dio.post('/auth/reissue',
            options: Options(headers: {
              "Refresh-Token": refreshToken,
            }));
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        final options = err.requestOptions;

        options.headers.addAll({
          'Authorization': newAccessToken,
        });

        TokenSecureStorage.writeAccessToken(newAccessToken);
        TokenSecureStorage.writeRefreshToken(newRefreshToken);

        final resend = await network.dio.fetch(options);

        return handler.resolve(resend);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }
    return handler.reject(err);
  }
}
