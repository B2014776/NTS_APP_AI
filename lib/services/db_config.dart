import 'package:dio/dio.dart';

class DioConfig {
  static Dio createDio() {
    final Dio dio = Dio();
    String _token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJxdW9jZHVuZzExMjAwMSIsImV4cCI6MTcyNTcxMzU5N30.eTuV2t6IoAULD92M1_E6uIeneNLzX_PnfBxWI2O1tQg";
    dio.options.baseUrl = 'https://api-ai-1-6b81.onrender.com';
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.options.followRedirects = true;
    dio.options.maxRedirects = 5;
    dio.options.headers['Authorization'] = 'Bearer $_token';

    dio.options.validateStatus = (status) {
      return status != null && status < 500;
    };
    return dio;
  }
}