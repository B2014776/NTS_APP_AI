import 'package:dio/dio.dart';
import '../../models/UserModel.dart';

class UserController {
  User? user;

  Future<void> fetchUserFromAPI() async {
    user = User(
      name: 'Ba Tung',
      email: 'Tung@Tung.com',
      phoneNumber: '0123456789',
      avatarUrl: '01f5e88f2a3c9aa14282135a21d5f0a1.png',
    );
    // try {
    //   // final response = await Dio().get('https://api-ai-l1r8.onrender.com/disease_iden_demo/Blast');
    //   // if (response.statusCode == 200) {
    //   //   user = User.fromJson(response.data);
    //2
    //   }
    // } catch (error) {
    //   print("Failed to load disease details: $error");
    // }
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
