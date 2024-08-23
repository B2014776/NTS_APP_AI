import 'package:dio/dio.dart';
import '../../models/UserModel.dart';

class UserController {
  User? user;

  Future<void> fetchUserFromAPI() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final Map<String, dynamic> sampleData = {
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'phoneNumber': '0123456789',
      };

      user = User.fromJson(sampleData);
    } catch (error) {
      print("Failed to load user details: $error");
    }
  }


  Future<void> updateUserToAPI(User updatedUser) async {
    try {
      final response = await Dio().put(
        'https://example.com/update_user',
        data: updatedUser.toJson(),
      );
      if (response.statusCode == 200) {
        user = updatedUser;
      }
    } catch (error) {
      print("Failed to update user details: $error");
    }
  }

  String getUserDetails() {
    if (user != null) {
      return "Tên: ${user!.name}\nEmail: ${user!.email}\nSố điện thoại: ${user!.phoneNumber ?? 'Chưa có'}";
    } else {
      return "Chưa có dữ liệu người dùng.";
    }
  }
}
