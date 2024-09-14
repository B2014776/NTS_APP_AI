import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditAccountController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var gender = ''.obs;
  var birthday = ''.obs;
  var location = ''.obs;
  var avatar = ''.obs;

  var isLoading = false.obs; // Trạng thái tải dữ liệu
  var isUsernameValid = true.obs;
  var isPhoneValid = true.obs;
  var isEmailValid = true.obs;
  var isGenderValid = true.obs;
  var isFormValid = false.obs;
  var showError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true; // Bắt đầu tải dữ liệu
      final response = await http.post(
        Uri.parse('https://api-ai-1-6b81.onrender.com/api/x?proc=Proc_Mobile_GetUserInfo'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode([{"name": "TaiKhoanID", "type": "guid", "value": "D748671B-AC85-4899-BA4E-BD86C02D826E"}]),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userData = data['data'][0];

        // Cập nhật các giá trị trong controller
        username.value = userData['HoVaTen'];
        email.value = userData['Email'];
        phone.value = userData['SoDienThoai'];
        gender.value = userData['GioiTinh'];
        birthday.value = userData['NgaySinh'];
        location.value = userData['DiaChi'];
        avatar.value = userData['AnhDaiDien'];

        isLoading.value = false; // Dữ liệu đã được tải xong
      } else {
        print("Lỗi khi gọi API: ${response.statusCode}");
        isLoading.value = false; // Dữ liệu không tải được
      }
    } catch (e) {
      print("Lỗi: $e");
      isLoading.value = false;
    }
  }

  bool isValidPhone(String input) {
    final phoneRegex = RegExp(r'^\d{10,12}$');
    return phoneRegex.hasMatch(input);
  }

  bool isValidEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  bool isValidGender(String input) {
    return input == 'Nam' || input == 'Nữ'; // Chỉ cho phép chọn "Nam" hoặc "Nữ"
  }

  void validateForm() {
    // Kiểm tra từng trường chỉ khi nó không rỗng
    if (username.value.isNotEmpty) {
      isUsernameValid.value = username.value.length >= 1;
    }

    if (phone.value.isNotEmpty) {
      isPhoneValid.value = isValidPhone(phone.value);
    }

    if (email.value.isNotEmpty) {
      isEmailValid.value = isValidEmail(email.value);
    }

    if (gender.value.isNotEmpty) {
      isGenderValid.value = isValidGender(gender.value);
    }

    // Nếu trường nào có giá trị và không hợp lệ, báo lỗi
    if (isUsernameValid.value &&
        isPhoneValid.value &&
        isEmailValid.value &&
        isGenderValid.value) {
      isFormValid.value = true;
      showError.value = false;
    } else {
      isFormValid.value = false;
      showError.value = true;
    }
  }

  void onSavePressed() {
    validateForm();
    if (isFormValid.value) {
      // Logic lưu thông tin ở đây
      print('Dữ liệu hợp lệ và sẵn sàng lưu.');
    } else {
      print('Dữ liệu không hợp lệ.');
    }
  }
}
