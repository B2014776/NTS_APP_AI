import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/auth/AuthController.dart'; // Import AuthController
import 'SocialMediaLogin.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController =
        Get.put(SignUpController()); // Khởi tạo SignUpController

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              'Đăng ký tài khoản',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF11960A),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // TextField cho Họ và tên
          TextField(
            onChanged: (value) {
              signUpController.username.value = value;
              signUpController.validateForm(); // Gọi hàm kiểm tra form
            },
            decoration: InputDecoration(
              hintText: 'Họ và tên',
              prefixIcon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.green,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // TextField cho Số điện thoại hoặc email
          TextField(
            onChanged: (value) {
              signUpController.phoneOrEmail.value = value;
              signUpController.validateForm(); 
            },
            decoration: InputDecoration(
              hintText: 'Nhập số điện thoại hoặc email',
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.green,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 15),

          Obx(() => signUpController.showError.value
              ? const Text(
                  'Vui lòng điền đầy đủ thông tin để đăng ký',
                  style: TextStyle(color: Colors.red),
                )
              : const SizedBox.shrink()),
          const SizedBox(height: 15),

          Obx(() => Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: signUpController.isFormValid.value
                      ? const Color(0xff538c51)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MaterialButton(
                  onPressed: signUpController.isFormValid.value
                      ? () {
                          signUpController.onSignupPressed();
                        }
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "Đồng ý với các điều khoản và đăng ký",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bạn đã có tài khoản?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                Text(
                  "Đăng nhập ngay",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0D9C50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            "Hoặc đăng nhập với",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const SocialMediaLogin(),
        ],
      ),
    );
  }
}
