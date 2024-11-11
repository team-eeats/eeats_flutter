import 'package:dio/dio.dart';
import 'package:eeats/core/network/base_url.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    headers: {
      "Content-Type": "application/json",
    }
  ),
);
