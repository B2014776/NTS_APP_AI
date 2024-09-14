import 'package:dio/dio.dart';

import '../services/db_config.dart';

class ProfileController {
  final Dio _dio = DioConfig.createDio();

  Future<List<dynamic>> getAllProfile() async {
    try {
      Response response = await _dio.get(
        '/api',
        queryParameters: {
          'proc': 'Proc_Mobile_GetUserInfo',
        },
      );

      return response.data;
    } catch (e) {
      print('Lỗi khi gọi API: $e');
      throw Exception('Failed to load posts');
    }
  }
}
