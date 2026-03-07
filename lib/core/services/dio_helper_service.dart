import 'package:bookia_application/core/utils/api_constants.dart';
import 'package:dio/dio.dart';

class DioHelperService {
  static Dio? _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio!.get(endPoint, queryParameters: query);
  }

  static Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? query,
    dynamic data, // body
  }) async {
    return await _dio!.post(
      endPoint,
      queryParameters: query,
      data: data, // body payload
    );
  }
}
