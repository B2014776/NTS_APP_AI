import 'package:apptestai/views/profile/widgets/BirthdayTextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth/EditAccountController.dart';
import 'widgets/Avatar.dart';
import 'widgets/birthPicker.dart'; // Đảm bảo bạn nhập đúng đường dẫn
import 'widgets/emailField.dart';
import 'widgets/genderDropdownField.dart'; // Nhập đúng đường dẫn
import 'widgets/phoneField.dart';
import 'widgets/usernameField.dart';
import 'widgets/localtionInput.dart';

class EditAccountPage extends StatefulWidget {
  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final EditAccountController controller = Get.put(EditAccountController());

  @override
  void initState() {
    super.initState();
    // Tải dữ liệu người dùng
    controller.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fdbba029e959749c39816f3b6c7b42f5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget Avatar
                AvatarWidget(avatarUrl: controller.avatar),
                SizedBox(height: 16),
                // Trường tên người dùng
                UsernameField(controller: controller),
                SizedBox(height: 16),
                // Trường email
                EmailField(controller: controller),
                SizedBox(height: 16),
                // Trường số điện thoại
                PhoneField(controller: controller),
                SizedBox(height: 16),
                // Trường giới tính
                GenderDropdownField(controller: controller), // Gọi GenderDropdownField với controller
                SizedBox(height: 16),
                // Trường ngày sinh
                DateOfBirthPicker(birthday: controller.birthday),
                SizedBox(height: 16),
                // Trường vị trí
                LocationInput(controller: controller),
                SizedBox(height: 16),
                // Nút lưu thông tin
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.onSavePressed();
                        if (controller.isFormValid.value) {
                          Get.snackbar('Thành công', 'Thông tin đã được cập nhật');
                        } else {
                          Get.snackbar('Lỗi', 'Thông tin không hợp lệ, vui lòng kiểm tra lại');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Lưu thông tin', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
