import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  BaseOptions baseOptions = BaseOptions(
    baseUrl: 'https://randomuser.me',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Future<Response> get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await Dio(baseOptions).get(
        url,
        queryParameters: queryParams,
      );
      if (kDebugMode) {
        print('GET $url: ${response.statusCode} ${response.data}');
      }
      return response;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(baseOptions).post(
        url,
        data: data,
      );
      if (kDebugMode) {
        print('POST $url: ${response.statusCode} ${response.data}');
      }
      return response;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(baseOptions).put(
        url,
        data: data,
      );
      if (kDebugMode) {
        print('PUT $url: ${response.statusCode} ${response.data}');
      }
      return response;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await Dio(baseOptions).delete(
        url,
        queryParameters: queryParams,
      );
      if (kDebugMode) {
        print('DELETE $url: ${response.statusCode} ${response.data}');
      }
      return response;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return 'Request was cancelled';
      case DioErrorType.connectionTimeout:
        return 'Connection timeout';
      case DioErrorType.unknown:
        return 'Something went wrong';
      case DioErrorType.receiveTimeout:
        return 'Receive timeout in connection';
      case DioErrorType.badCertificate:
        return 'Unknown error';
      case DioErrorType.connectionError:
        return 'Connection error';
      case DioErrorType.badResponse:
        return error.response?.data['message'] ?? 'Failed to get response';
      case DioErrorType.sendTimeout:
        return 'Send timeout in connection';
    }
  }
}
