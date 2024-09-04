import 'package:apptestai/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controllers/auth/AuthController.dart';
import '../../ultils/CustomTextField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    void handleLogin() {
      print(loginController.username.value);
      if (loginController.username.value == 'admin' &&
          loginController.password.value == 'admin') {
        Get.offAll(() => HomePage());
      } else {
        Get.snackbar(
            'Lỗi đăng nhập', 'Tên đăng nhập hoặc mật khẩu không chính xác',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                      color: const Color(0xff538c51),
                      height: 250,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: SvgPicture.asset(
                                'assets/iconNTLogo.svg',
                                width: 65,
                                height: 65,
                              )),
                          const Spacer(),
                          const Expanded(
                              flex: 11,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nông nghiệp thông minh',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text('Nhất Tâm',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white))
                                ],
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 160, 30, 20),
                      child: Container(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 6),
                            CustomTextFieldV6(
                              controller: TextEditingController(
                                  text: loginController.username.value),
                              title: 'Tên tài khoản',
                              isRequired: false,
                              icon: const Icon(
                                Icons.account_circle_outlined,
                                color: Colors.green,
                              ),
                              textStyle: const TextStyle(fontSize: 14),
                              hintText: 'Nhập tên tài khoản',
                            ),
                            const SizedBox(height: 8),
                            CustomTextFieldV6(
                              controller: TextEditingController(
                                  text: loginController.password.value),
                              title: 'Mật khẩu',
                              isRequired: false,
                              icon: const Icon(
                                Icons.lock_outline,
                                color: Colors.green,
                              ),
                              textStyle: const TextStyle(fontSize: 14),
                              hintText: 'Nhập mật khẩu vào đây',
                              customIcon:
                                  Image.asset('assets/iconPassword.png'),
                            ),
                            Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Checkbox(
                                              value: loginController
                                                  .isCheckLogin.value,
                                              onChanged: loginController
                                                  .toggleCheckLogin,
                                            ),
                                          ),
                                          const SizedBox(width: 0),
                                          const Expanded(
                                            child: Text(
                                              "Nhớ mật khẩu",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 0.0),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Quên Mật Khẩu ?",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 0),
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff538c51),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  handleLogin();
                                },
                                child: const Text(
                                  "Đăng Nhập",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Bạn chưa có tài khoản?",
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Đăng ký",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff006400)),
                                    )),
                              ],
                            ),
                            const Text(
                              "Hoặc đăng nhập với",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: 0,
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      'assets/ic_facebook_logo.svg'),
                                ),
                                const SizedBox(width: 0),
                                MaterialButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: 0,
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      'assets/ic_google_logo.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 2,
                height: 200,
                child: Image.asset(
                  'assets/bottomimage.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
      ),
    );
  }
}
