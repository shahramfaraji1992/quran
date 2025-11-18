import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;
  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'http://api.alquran.cloud/v1/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );
  Future<Response> get(String endpoint) async {
    return await _dio.get(endpoint);
  }
}
