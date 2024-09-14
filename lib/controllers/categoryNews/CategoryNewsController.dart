import 'package:dio/dio.dart';

import '../../services/dio_config.dart';

class CategoryNewController {
  final Dio _dio = DioConfig.createDio();

  Future<List<dynamic>> getAllCategoryNew() async {
    try {
      Response response = await _dio.get('/danhmuctintuc');
      return response.data;
    } catch (e) {
      print('Lỗi khi gọi API: $e');
      throw Exception('Failed to load posts');
    }
  }
}
