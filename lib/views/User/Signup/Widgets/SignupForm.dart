import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/auth/AuthController.dart';
import '../verify.dart';
import 'SocialMediaLogin.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final SignUpController signUpController = Get.put(SignUpController());

  String phoneOrEmail = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'Đăng ký tài khoản',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF11960A),
              ),
            ),
          ),
          const SizedBox(height: 37),
          TextField(
            onChanged: (value) {
              setState(() {
                signUpController.username.value = value;
                signUpController.validateForm();
              });
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.green,
                ),
              ),
              errorText: signUpController.isUsernameValid.value
                  ? null
                  : 'Họ và tên không hợp lệ',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: (value) {
              setState(() {
                signUpController.phoneOrEmail.value = value;
                signUpController.validateForm();
                phoneOrEmail = value;
              });
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.green,
                ),
              ),
              errorText: signUpController.isPhoneOrEmailValid.value
                  ? null
                  : 'Số điện thoại hoặc email không hợp lệ',
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextField(
              onChanged: (value) {
                setState(() {
                  signUpController.password.value = value;
                  signUpController.validateForm();
                });
              },
              obscureText: !signUpController.isPasswordVisible.value,
              decoration: InputDecoration(
                hintText: 'Mật khẩu',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.green,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    signUpController.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    signUpController.isPasswordVisible.value =
                        !signUpController.isPasswordVisible.value;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
                errorText: signUpController.password.value.isNotEmpty
                    ? null
                    : 'Mật khẩu không được để trống',
              ),
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextField(
              onChanged: (value) {
                setState(() {
                  signUpController.confirmPassword.value = value;
                  signUpController.validateForm();
                });
              },
              obscureText: !signUpController.isConfirmPasswordVisible.value,
              decoration: InputDecoration(
                hintText: 'Nhập lại mật khẩu',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.green,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    signUpController.isConfirmPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    signUpController.isConfirmPasswordVisible.value =
                        !signUpController.isConfirmPasswordVisible.value;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
                errorText: signUpController.isPasswordMatch.value
                    ? null
                    : 'Mật khẩu không khớp',
              ),
            ),
          ),
          Obx(() => signUpController.showError.value
              ? const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    'Vui lòng điền đầy đủ thông tin để đăng ký',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink()),
          const SizedBox(height: 15),
          Obx(() => Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: signUpController.isFormValid.value
                    ? const Color(0xff538c51)
                    : Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: MaterialButton(
                onPressed: signUpController.isFormValid.value
                    ? () async {
                        Map<String, dynamic> result =
                            await signUpController.sendVerificationCode();
                        if (result.containsKey('error')) {
                          print('Gửi mã xác thực thất bại: ${result['error']}');
                        } else {
                          bool isPhone =
                              signUpController.phoneOrEmail.value.contains("@")
                                  ? false
                                  : true;

                          VerifyArg arg = VerifyArg(
                              isPhone: isPhone,
                              value: signUpController.phoneOrEmail.value);

                          SignupInfo signupInfo = SignupInfo(
                            fullName: signUpController.fullName.value,
                            phoneOrEmail: signUpController.phoneOrEmail.value,
                            password: signUpController.password.value,
                            confirmPassword:
                                signUpController.confirmPassword.value,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyScreen(
                                arg: arg,
                                signupInfo: signupInfo,
                              ),
                            ),
                          );
                        }
                      }
                    : null,
                child: const Text(
                  "Đồng ý với các điều khoản và đăng ký",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn đã có tài khoản?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    // TODO: navigate to signin screen
                  },
                  child: const Text(
                    "Đăng nhập ngay",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0D9C50),
                      fontWeight: FontWeight.bold,
                    ),
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
          const SizedBox(height: 18),
          const SocialMediaLogin(),
        ],
      ),
    );
  }
}
