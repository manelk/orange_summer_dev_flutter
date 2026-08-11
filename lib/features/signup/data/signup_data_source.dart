import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_app_test/core/data/urls.dart';

import 'model/request/signup_request_model.dart';
import 'model/response/signup_response_model.dart';

class SignupDataSource {
  final Dio _dio;

  SignupDataSource({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiEndpoints.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              validateStatus: (_) => true,
            ),
          );

  Future<SignupResponseModel> signup(SignupRequestModel request) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.signup,
        data: request.toJson(),
      );

      if (response.statusCode == HttpStatus.badRequest) {
        throw const SignupDataSourceException('Invalid signup data.');
      }

      if (response.statusCode == HttpStatus.conflict) {
        throw const SignupDataSourceException('Email is already registered.');
      }

      if (response.statusCode == null ||
          response.statusCode! < HttpStatus.ok ||
          response.statusCode! >= HttpStatus.multipleChoices) {
        throw const SignupDataSourceException('Something went wrong.');
      }

      final data = response.data;
      if (data is! Map) {
        throw const SignupDataSourceException('Something went wrong.');
      }

      return SignupResponseModel.fromJson(Map<String, dynamic>.from(data));
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        throw const SignupDataSourceException('Please check your connection.');
      }
      throw const SignupDataSourceException('Something went wrong.');
    } on SignupDataSourceException {
      rethrow;
    } catch (_) {
      throw const SignupDataSourceException('Signup failed.');
    }
  }
}

class SignupDataSourceException implements Exception {
  final String message;

  const SignupDataSourceException(this.message);
}
