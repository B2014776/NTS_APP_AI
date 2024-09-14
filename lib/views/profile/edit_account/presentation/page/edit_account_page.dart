import 'package:apptestai/views/profile/edit_account/presentation/controller/edit_account_controller.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/Avatar.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/BirthdayTextfield.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/GenderDropdownField.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/emailField.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/localtionInput.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/phoneField.dart';
import 'package:apptestai/views/profile/edit_account/presentation/widgets/usernameField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountPage extends GetView<EditAccountController> {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Thông tin cá nhân',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/fdbba029e959749c39816f3b6c7b42f5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: Text("Loading ...."),
                )
              : Container(
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
                          const SizedBox(height: 16),
                          // Trường tên người dùng
                          UsernameField(controller: controller),
                          const SizedBox(height: 16),
                          // Trường email
                          EmailField(controller: controller),
                          const SizedBox(height: 16),
                          // Trường số điện thoại
                          PhoneField(controller: controller),
                          const SizedBox(height: 16),
                          // Trường giới tính
                          GenderDropdownField(controller: controller),
                          // Gọi GenderDropdownField với controller
                          const SizedBox(height: 16),
                          // Trường ngày sinh
                          DateOfBirthPicker(birthday: controller.birthday),
                          const SizedBox(height: 16),
                          // Trường vị trí
                          LocationInput(controller: controller),
                          const SizedBox(height: 16),
                          // Nút lưu thông tin
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                            child: SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller
                                      .onSavePressed(); // Gọi phương thức xử lý khi nhấn nút lưu
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Lưu thông tin',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
