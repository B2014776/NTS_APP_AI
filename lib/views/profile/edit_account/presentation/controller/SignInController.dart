import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../services/dio_config.dart';

class SignInController extends GetxController {
  var isLoginLoading = false.obs;
  var loginErrorMessage = ''.obs;

  final Dio _dio = DioConfig.createDio();

  bool isValidEmail(String input) {
    return input.isNotEmpty && input.contains('@');
  }

  bool isValidPassword(String input) {
    return input.isNotEmpty && input.length >= 6;
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    Map<String, dynamic> result = {};

    if (!isValidEmail(email) || !isValidPassword(password)) {
      loginErrorMessage.value = 'Email hoặc mật khẩu không hợp lệ.';
      return result;
    }

    try {
      isLoginLoading.value = true;

      Map<String, dynamic> body = {
        'username': email,
        'password': password,
      };

      final response = await _dio.post(
        '/auth/signin',
        data: body,
      );

      if (response.statusCode == 200) {
        result = response.data;
        print('Đăng nhập thành công.');
      } else if (response.statusCode == 401) {
        loginErrorMessage.value = 'Sai email hoặc mật khẩu.';
      } else {
        loginErrorMessage.value =
            'Đăng nhập thất bại: ${response.statusMessage}';
      }
    } catch (error) {
      loginErrorMessage.value = 'Lỗi khi đăng nhập: $error';
    } finally {
      isLoginLoading.value = false; // Set loading to false
    }

    return result;
  }
}
