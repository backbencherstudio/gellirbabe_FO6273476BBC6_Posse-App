// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/caches/shared_preferences.dart';
import 'api_end_points.dart';
import 'error_handle.dart';
import 'response_handle.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  static Map<String, String>? headers;

  static Future<void> headerSet() async {
    final token = await SharedPreferenceData.getToken();

    headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
  }

  /// GET request
  Future<dynamic> getRequest({
    required String endpoints,
   // Map<String, String>? headers,
  }) async {
    try {
      log("\n\n\n\nurl :${ApiEndpoints.baseUrl}/$endpoints \n\n\n\n");
      final response = await _dio.get(
        '/$endpoints',
        options: Options(
          headers: headers ?? {"Content-Type": "application/json"},
        ),
      );
      // log("\n\n\nGET Request Successful: ${response.data}\n\n\n");
      return ResposeHandle.handleResponse(response);
    } catch (e) {
      if (e is DioException) {
        ErrorHandle.handleDioError(e);
      } else {
        print('Non-Dio error: $e');
      }
    }
  }

  /// POST request
  Future<dynamic> postRequest({
    required String endpoints,
    Map<String, dynamic>? body,
    FormData? formData,
  }) async {
    try {
      log("\n\n\n\n :$headers \n\n\n\n");
      log("\n\nurl :${ApiEndpoints.baseUrl}/$endpoints\n\n");
      final response = await _dio.post(
        '/$endpoints',
        data: body ?? formData,
        options: Options(
          headers: headers ?? {"Content-Type": "application/json"},
        ),
      );
      //log("\nPOST Request Successful: ${response.data}\n");
      return ResposeHandle.handleResponse(response);
    } catch (e) {
      if (e is DioException) {
        ErrorHandle.handleDioError(e);
      } else {
        print('Non-Dio error: $e');
      }
    }
  }

  /// PUT request
  static Future<dynamic> putRequest({
    required String endpoints,
    required Map<String, dynamic> body,
  
  }) async {
    try {
      log("\n\nurl :${ApiEndpoints.baseUrl}/$endpoints\n\n");
      final response = await _dio.put(
        '/$endpoints',
        data: body,
        options: Options(
          headers: headers ?? {"Content-Type": "application/json"},
        ),
      );
      // debugPrint("\nPUT Request Successful: ${response.data}\n");
      return ResposeHandle.handleResponse(response);
    } catch (e) {
      if (e is DioException) {
        ErrorHandle.handleDioError(e);
      } else {
        print('Non-Dio error: $e');
      }
    }
  }

  /// PATCH request
  Future<dynamic> patchRequest({
    required String endpoints,
    Map<String, dynamic>? body,

    FormData? formData,
  }) async {
    try {
      log("\n\nurl :${ApiEndpoints.baseUrl}/$endpoints\n\n");
      final response = await _dio.patch(
        '${ApiEndpoints.baseUrl}/$endpoints',
        data: body ?? formData,
        options: Options(
          headers: headers ?? {"Content-Type": "multipart/form-data"},
        ),
      );

      debugPrint("\nPATCH Request Successful");
      debugPrint("Status: ${response.statusCode}");
      debugPrint("Data: ${response.data}");

      return ResposeHandle.handleResponse(response);
    } catch (e) {
      if (e is DioException) {
        ErrorHandle.handleDioError(e);
      } else {
        print('Non-Dio error: $e');
      }
    }
  }

  /// PATCH request
  static Future<dynamic> deleteRequest({
    required String endpoints,
  }) async {
    try {
      log("\n\nurl :${ApiEndpoints.baseUrl}/$endpoints\n\n");
      final response = await _dio.delete(
        '/$endpoints',
        options: Options(
          headers: headers ?? {"Content-Type": "multipart/form-data"},
        ),
      );

      debugPrint("delete Request Successful");
      debugPrint("Status: ${response.statusCode}");
      debugPrint("Data: ${response.data}");

      return ResposeHandle.handleResponse(response);
    } catch (e) {
      if (e is DioException) {
        ErrorHandle.handleDioError(e);
      } else {
        print('Non-Dio error: $e');
      }
    }
  }
}
