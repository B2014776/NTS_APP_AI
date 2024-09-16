
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../services/dio_config.dart';



class SignUpController extends GetxController {

  var username = ''.obs;
  var fullName = ''.obs;
  var phoneOrEmail = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isFormValid = false.obs;
  var showError = false.obs;

  var isUsernameValid = false.obs;
  var isPhoneOrEmailValid = false.obs;
  var isPasswordMatch = false.obs;

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;


  final Dio _dio = DioConfig.createDio();
  bool isValidUsername(String input) {
    return input.isNotEmpty && input.length >= 3;
  }

  bool isValidPhoneOrEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final phoneRegex = RegExp(r'^\d{10,12}$');
    return emailRegex.hasMatch(input) || phoneRegex.hasMatch(input);
  }

  bool isPasswordsMatch() {
    return password.value == confirmPassword.value;
  }

  void validateForm() {
    isUsernameValid.value = isValidUsername(username.value);
    isPhoneOrEmailValid.value = isValidPhoneOrEmail(phoneOrEmail.value);
    isPasswordMatch.value = isPasswordsMatch();

    if (isUsernameValid.value &&
        isPhoneOrEmailValid.value &&
        password.value.isNotEmpty &&
        isPasswordMatch.value) {
      isFormValid.value = true;
      showError.value = false;
    } else {
      isFormValid.value = false;
      showError.value = true;
    }
  }

  void onSignupPressed() {
    validateForm();
    if (isFormValid.value) {
      sendVerificationCode();
    } else {
      print("Vui lòng điền đầy đủ thông tin để đăng ký");
    }
  }

  Future<Map<String, dynamic>> sendVerificationCode() async {
    Map<String, dynamic> result = {};

    try {
      Map<String, dynamic> body = {
        "email": phoneOrEmail.value,
      };

      final response = await _dio.post(
        '/verify/send-verify-code/',
        data: body,
      );

      print('Response Status: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        result = response.data;
      } else if (response.statusCode == 307) {
        var redirectUrl = response.headers.value('location');
        final redirectResponse = await _dio.post(redirectUrl!, data: body);

        if (redirectResponse.statusCode == 200) {
          result = redirectResponse.data;
        } else {
          result['error'] = 'Failed to send verification code after redirect';
        }

        result['redirect'] = redirectUrl;
        print('Redirecting to: $redirectUrl');
      } else {
        result['error'] = 'Failed to send verification code';
      }
    } catch (error) {
      result['error'] = 'Error: $error';
    }
    return result;
  }

  Future<Map<String, dynamic>> verifyCode(String code) async {
    Map<String, dynamic> result = {};

    try {
      Map<String, dynamic> body = {
        'email': phoneOrEmail.value,
        'code': code,
      };

      final response = await _dio.post(
        '/verify/verify-code',
        data: body,
      );

      if (response.statusCode == 200) {
        result = response.data;
        print('Xác thực mã thành công.');
      } else if (response.statusCode == 307) {
        var redirectUrl = response.headers.value('location');
        final redirectResponse = await _dio.post(redirectUrl!, data: body);

        if (redirectResponse.statusCode == 200) {
          result = redirectResponse.data;
          print('Xác thực mã thành công sau khi chuyển hướng.');
        } else {
          result['error'] = 'Xác thực mã thất bại sau khi chuyển hướng';
        }

        result['redirect'] = redirectUrl;
        print('Redirecting to: $redirectUrl');
      } else {
        result['error'] = 'Xác thực mã thất bại: ${response.statusMessage}';
      }
    } catch (error) {
      result['error'] = 'Lỗi khi xác thực mã: $error';
    }
    return result;
  }


  Future<Map<String, dynamic>> sendSignUpRequest() async {
    Map<String, dynamic> result = {};

    try {
      Map<String, dynamic> body = {
        'username': phoneOrEmail.value,
        'password': password.value,
        'full_name': username.value,
        'activation_method': 2, // 1: He thong, 2 Email, 3: SDT, 4: Apple Id
        'status_id': 11,
      };

      final response = await _dio.post(
        '/auth/signup',
        data: body,
      );

      if (response.statusCode == 200) {
        result = response.data;
        if (result['success'] == true) {
          print('Đăng ký thành công.');
        } else {
          result['error'] = 'Đăng ký thất bại: ${result['msg'] ?? 'Thông tin xác thực không chính xác'}';
        }
      } else if (response.statusCode == 307) {
        var redirectUrl = response.headers.value('location');
        if (redirectUrl != null) {
          final redirectResponse = await _dio.post(redirectUrl, data: body);
          if (redirectResponse.statusCode == 200) {
            result = redirectResponse.data;
            if (result['success'] == true) {
              print('Đăng ký thành công');
            } else {
              result['error'] = 'Đăng ký thất bại: ${result['msg'] ?? 'Thông tin xác thực không chính xác'}';
            }
          } else {
            result['error'] = 'Đăng ký thất bại sau khi chuyển hướng: ${redirectResponse.statusMessage}';
          }
        } else {
          result['error'] = 'Chuyển hướng không thành công: Không có URL chuyển hướng';
        }
      } else {
        result['error'] = 'Đăng ký thất bại: ${response.statusMessage}';
      }
    } catch (error) {
      result['error'] = 'Lỗi khi gửi yêu cầu đăng ký: $error';
    }

    return result;
  }



}
