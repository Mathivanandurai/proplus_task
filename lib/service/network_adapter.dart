import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/shared_preferences.dart';
import 'error_response.dart';
import 'exceptions.dart';
import 'interceptor.dart';

export 'endpoints.dart';

enum ApiRequestType { get, post, patch, delete, put, download }

class NetworkAdapter {
  // Singleton
  static final NetworkAdapter shared = NetworkAdapter._privateConstructor();

  NetworkAdapter._privateConstructor();

  Future<void> apiCall({
    required String url,
    required ApiRequestType requestType,
    bool shouldAddToken = true,
    dynamic data,
    Map<String, dynamic>? headerData,
    Map<String, dynamic>? queryParams,
    String pathToSave = "",
    Function(int, int)? onReceiveProgress,
    Function(int, int)? onSendProgress,
    required Function() onLoading,
    required Function(Response response) onSuccess,
    required Function(Either<ApiException, ErrorResponse>) onError,
  }) async {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
    );

    if (shouldAddToken) {
      final token = await SharedPreferenceHelper.shared.getAccessToken();
      options.headers = {'Authorization': "Bearer $token"};
    }
    if (headerData != null) {
      options.headers.addAll(headerData);
    }
    options.headers.addAll({
      Headers.contentTypeHeader: Headers.jsonContentType,
      "Accept": "application/vnd.github+json"
    });

    Response response;
    Dio dio = Dio(options);

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));

    await onLoading();
    try {
      switch (requestType) {
        case ApiRequestType.get:
          response = await dio.get(
            url,
            queryParameters: queryParams,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case ApiRequestType.post:
          response = await dio.post(url,
              data: data,
              queryParameters: queryParams,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress);

          break;
        case ApiRequestType.patch:
          response = await dio.patch(url,
              data: data,
              queryParameters: queryParams,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress);
          break;
        case ApiRequestType.put:
          response = await dio.put(url,
              data: data,
              queryParameters: queryParams,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress);
          break;
        case ApiRequestType.delete:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParams,
          );
        case ApiRequestType.download:
          response = await dio.download(
            url,
            pathToSave,
            onReceiveProgress: onReceiveProgress,
          );
          break;
      }

      await onSuccess(response);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          onError(Left(FetchDataException(error.message ?? "Time Out")));
        case DioExceptionType.unknown:
          onError(Left(FetchDataException(
              error.message ?? "Oops something went wrong")));
          break;
        case DioExceptionType.badCertificate:
          onError(Left(BadResponseException(error.response)));
          break;
        case DioExceptionType.badResponse:
          if (error.response == null) {
            onError(Left(BadResponseException(error.response)));
            break;
          }
          onError(Right(ErrorResponse.fromJson(error.response?.data)));
          break;
        case DioExceptionType.cancel:
          onError(Left(CancelResponseException(error.message)));
          break;
        case DioExceptionType.connectionError:
          onError(Left(InternetConnectivityException(null)));
          break;
        default:
          onError(Left(FetchDataException(
              error.message ?? "Oops, Something went wrong")));
          break;
      }
    } catch (e) {

      onError(Left(FetchDataException("$e")));
    }
  }
}
