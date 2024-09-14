import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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

  Dio dio = Dio();

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

  Future<void> sendVerificationCode() async {
    try {
      final response = await dio.post(
        'https://d4f4-171-243-58-90.ngrok-free.app/verify/send-verify-code/',
        data: {
          'email': phoneOrEmail.value,
        },
      );

      if (response.statusCode == 200) {
        print('Mã xác thực đã được gửi.');
      } else {
        print('Gửi mã xác thực thất bại: ${response.statusMessage}');
      }
    } catch (e) {
      print('Lỗi khi gửi mã xác thực: $e');
    }
  }

  Future<void> verifyCode(String code) async {
    try {
      final response = await dio.post(
        'https://d4f4-171-243-58-90.ngrok-free.app/verify/verify-code',
        data: {
          'email': phoneOrEmail.value,
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        print('Xác thực mã thành công.');
      } else {
        print('Xác thực mã thất bại: ${response.statusMessage}');
      }
    } catch (e) {
      print('Lỗi khi xác thực mã: $e');
    }
  }

  Future<void> sendSignUpRequest() async {
    try {
      final response = await dio.post(
        'https://d4f4-171-243-58-90.ngrok-free.app/auth/signin',
        data: {
          'username': phoneOrEmail.value,
          'password': password.value,
          'full_name': fullName.value,
          'activation_method': 2,       // 1: He thong, 2 Email, 3: SDT, 4: Apple Id
          'status_id': 11,
        },
      );

      if (response.statusCode == 200) {
        print('Đăng ký thành công.');
      } else {
        print('Đăng ký thất bại: ${response.statusMessage}');
      }
    } catch (e) {
      print('Lỗi khi gửi yêu cầu đăng ký: $e');
    }
  }


}
