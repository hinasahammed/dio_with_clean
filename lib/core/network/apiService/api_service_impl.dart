import 'package:dio_with_clean/core/error/exceptions.dart';
import 'package:dio_with_clean/core/network/apiService/api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl implements ApiService {
  ApiServiceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;
  @override
  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkException(message: 'Network error occurred');
      case DioExceptionType.badResponse:
        return ServerException(
          message: e.response?.data['message'] ?? 'Server error occurred',
          statusCode: e.response?.statusCode,
        );
      default:
        return ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }
}
