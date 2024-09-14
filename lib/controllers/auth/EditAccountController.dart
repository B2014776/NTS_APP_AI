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
        Uri.parse('https://api-ai-1-6b81.onrender.com/api/?proc=Proc_Mobile_GetUserInfo'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode([{"name": "TaiKhoanID", "type": "guid", "value": "D748671B-AC85-4899-BA4E-BD86C02D826E"}]),
      );

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes); // Chuyển đổi mã hóa
        final data = jsonDecode(decodedResponse);
        final userData = data['data'][0];

        // Cập nhật các giá trị trong controller
        username.value = userData['HoVaTen'];
        email.value = userData['Email'];
        phone.value = userData['SoDienThoai'];

        // Kiểm tra và hiển thị giới tính
        if (userData['GioiTinh'] == 'Nam' || userData['GioiTinh'] == 'Nữ') {
          gender.value = userData['GioiTinh'];
        } else {
          gender.value = 'Không xác định'; // Giá trị mặc định nếu giới tính không hợp lệ
        }

        // Chuyển đổi và định dạng ngày sinh
        birthday.value = formatDate(userData['NgaySinh']);

        // Xử lý địa chỉ và avatar
        location.value = userData['DiaChi']?.isEmpty ?? true ? 'Không có địa chỉ' : userData['DiaChi'];
        // avatar.value = userData['AnhDaiDien']?.isEmpty ?? true ? 'default_avatar_url' : userData['AnhDaiDien'];
        avatar.value = userData['AnhDaiDien'];

        print('Username: ${username.value}');
        print('Email: ${email.value}');
        print('Phone: ${phone.value}');
        print('Gender: ${gender.value}');
        print('Birthday: ${birthday.value}');
        print('Location: ${location.value}');
        print('Avatar: ${avatar.value}');

        isLoading.value = false; // Dữ liệu đã được tải xong
      } else {
        print("Lỗi khi gọi API: ${response.statusCode}, nội dung: ${response.body}");
        isLoading.value = false; // Dữ liệu không tải được
      }
    } catch (e) {
      print("Lỗi: $e");
      isLoading.value = false;
    }
  }

  // Chuyển đổi chuỗi ngày sinh thành DateTime
  String formatDate(String dateStr) {
    try {
      final parts = dateStr.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      return DateTime(year, month, day).toIso8601String(); // Chuyển về định dạng chuẩn ISO8601
    } catch (e) {
      return dateStr; // Trả về giá trị gốc nếu có lỗi
    }
  }

  // Kiểm tra tính hợp lệ của số điện thoại
  bool isValidPhone(String input) {
    final phoneRegex = RegExp(r'^\d{10,12}$');
    return phoneRegex.hasMatch(input);
  }

  // Kiểm tra tính hợp lệ của email
  bool isValidEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  // Kiểm tra tính hợp lệ của giới tính
  bool isValidGender(String input) {
    return input == 'Nam' || input == 'Nữ'; // Chỉ cho phép "Nam" hoặc "Nữ"
  }

  // Xác thực form
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

    // Nếu tất cả các trường hợp lệ, form được xác thực
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

  // Xử lý khi nhấn nút lưu
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
