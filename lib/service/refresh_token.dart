import 'dart:developer';

import 'package:dio/dio.dart';

class RefreshTokenHandler {

  static Future<Response> callRefreshToken(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String url}) async {
    Dio dio = Dio(BaseOptions(headers: headers));
    // dio.interceptors.add(LogNetworkInterceptor(loggedDio: dio));
    try {
      final Response response = await dio.post(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> retryApi(
    Dio loggedDio,
    RequestOptions requestOptions,
    String token,
    Map<String, dynamic>? headers,
  ) async {
    log('🔁 Retry with new Token: $token');
    final options = Options(method: requestOptions.method, headers: headers);
    return await loggedDio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
