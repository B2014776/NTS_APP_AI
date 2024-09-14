import 'package:get/get.dart';

class SignUpController extends GetxController {
  var username = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var enterPassword = ''.obs;
  var isCheckLogin = false.obs;

  void toggleCheckLogin(bool? value) {
    isCheckLogin.value = value ?? false;
  }

}

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isCheckLogin = false.obs;

  void toggleCheckLogin(bool? value) {
    isCheckLogin.value = value ?? false;
  }

  bool login(String username, String password) {
    if (username == "1" && password == "1") {
      return true;
    }
    return false;
  }
}
