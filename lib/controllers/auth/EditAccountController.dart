import 'package:flutter/material.dart';
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
        body: jsonEncode([{"name": "TaiKhoanID", "type": "guid", "value": "d748671b-ac85-4899-ba4e-bd86c02d826f"}]),
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
  Future<void> updateUserData() async {
    try {
      isLoading.value = true; // Bắt đầu tải dữ liệu

      // Xây dựng dữ liệu theo định dạng yêu cầu của stored procedure
      final requestData = [
        {"name": "Email", "type": "nvarchar", "value": email.value},
        {"name": "SoDienThoai", "type": "nvarchar", "value": phone.value},
        {"name": "GioiTinh", "type": "nvarchar", "value": gender.value},
        {"name": "NgaySinh", "type": "date", "value": birthday.value},
        {"name": "HoVaTen", "type": "nvarchar", "value": username.value},
        {"name": "DiaChi", "type": "nvarchar", "value": location.value},
        {"name": "TaiKhoanID", "type": "uniqueidentifier", "value": "d748671b-ac85-4899-ba4e-bd86c02d826f"},
        {"name": "AnhDaiDien", "type": "nvarchar", "value": avatar.value.isEmpty ? null : avatar.value},
      ];

      final response = await http.post(
        Uri.parse('https://api-ai-1-6b81.onrender.com/api/?proc=Proc_Mobile_UpdateUserInfo'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      // In ra mã trạng thái và nội dung phản hồi từ API
      print('Mã trạng thái phản hồi từ API: ${response.statusCode}');
      print('Nội dung phản hồi từ API: ${response.body}');

      if (response.statusCode == 200) {
        // Hiển thị snackbar thành công
        Get.snackbar(
          'Thành công',
          'Bạn đã lưu thông tin thành công',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Thông báo lỗi nếu không thành công
        Get.snackbar(
          'Lỗi',
          'Có lỗi xảy ra khi cập nhật thông tin: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Hiển thị thông báo lỗi nếu có lỗi
      Get.snackbar(
        'Lỗi',
        'Đã xảy ra lỗi: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false; // Kết thúc quá trình tải dữ liệu
    }
  }





  Future<void> onSavePressed() async {
    validateForm();
    if (isFormValid.value) {
      await updateUserData(); // Gọi phương thức cập nhật dữ liệu
    } else {
      Get.snackbar('Lỗi', 'Thông tin không hợp lệ, vui lòng kiểm tra lại', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }




// Xử lý khi nhấn nút lưu
}
