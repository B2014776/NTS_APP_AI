import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  var username = ''.obs;
  var phoneOrEmail = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isFormValid = false.obs;
  var showError = false.obs;

  var isUsernameValid = false.obs;
  var isPhoneOrEmailValid = false.obs;
  var isPasswordMatch = false.obs;

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
      print("Đăng ký thành công với tên: ${username.value}, số điện thoại/email: ${phoneOrEmail.value}, mật khẩu: ${password.value}");
    } else {
      print("Vui lòng điền đầy đủ thông tin để đăng ký");
    }
  }

}
