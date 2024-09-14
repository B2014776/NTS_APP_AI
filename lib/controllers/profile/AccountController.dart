import 'package:dio/dio.dart';
import '../../models/UserModel.dart';

class UserController {
  User? user;

  // Hàm này sẽ sử dụng dữ liệu giả thay vì gửi yêu cầu đến một API
  Future<void> fetchUserFromAPI() async {
    // Dữ liệu giả để mô phỏng phản hồi từ API
    await Future.delayed(Duration(seconds: 1)); // Giả lập thời gian tải dữ liệu
    user = User(
      name: 'Ba Tung',
      email: 'Tung@Tung.com',
      phoneNumber: '0123456789',
      avatarUrl: 'avatar.jpg',
      dateOfBirth: '1990-01-01', // Ngày sinh giả
      gender: 'Nam', // Giới tính giả
    );
  }

  // Hàm cập nhật dữ liệu người dùng
  Future<void> updateUserToAPI(User updatedUser) async {
    try {
      // Giả lập cập nhật dữ liệu người dùng
      await Future.delayed(Duration(seconds: 1)); // Giả lập thời gian cập nhật
      user = updatedUser; // Cập nhật thông tin người dùng với dữ liệu mới
    } catch (error) {
      print("Failed to update user details: $error");
    }
  }

  // Hàm trả về thông tin người dùng dưới dạng chuỗi
  String getUserDetails() {
    if (user != null) {
      return "Tên: ${user!.name}\nEmail: ${user!.email}\nSố điện thoại: ${user!.phoneNumber}\nNgày sinh: ${user!.dateOfBirth ?? 'Chưa có'}\nGiới tính: ${user!.gender ?? 'Chưa có'}";
    } else {
      return "Chưa có dữ liệu người dùng.";
    }
  }
}
