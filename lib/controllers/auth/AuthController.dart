import 'package:get/get.dart';

class SignUpController extends GetxController {
  var username = ''.obs;
  var phoneOrEmail = ''.obs;
  var isFormValid = false.obs;
  var showError = false.obs;

  // Kiểm tra tính hợp lệ của form
  void validateForm() {
    if (username.value.isNotEmpty && phoneOrEmail.value.isNotEmpty) {
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
      print(
          "Đăng ký thành công với tên: ${username.value} và số điện thoại/email: ${phoneOrEmail.value}");
    } else {
      print("Vui lòng điền đầy đủ thông tin để đăng ký");
    }
  }
}
