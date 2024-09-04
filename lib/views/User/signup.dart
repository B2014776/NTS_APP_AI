import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/LoginController.dart';
import '../../controllers/auth/AuthController.dart';
import '../../ultils/CustomTextField.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

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
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                text: signUpController.username.value),
                            title: 'Tài khoản',
                            isRequired: false,
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.green,
                            ),
                            textStyle: const TextStyle(fontSize: 14),
                            hintText: 'Nhập tên tài khoản',
                            // onChanged: (value) => signUpController.username.value = value,
                          ),
                          const SizedBox(height: 5),
                          CustomTextFieldV6(
                            controller: TextEditingController(
                                text: signUpController.phone.value),
                            title: 'Số điện thoại',
                            isRequired: false,
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                            textStyle: const TextStyle(fontSize: 14),
                            hintText: 'Nhập số điện thoại',
                            // onChanged: (value) => signUpController.phone.value = value,
                          ),
                          const SizedBox(height: 5),
                          CustomTextFieldV6(
                            controller: TextEditingController(
                                text: signUpController.email.value),
                            title: 'Email',
                            isRequired: false,
                            icon: const Icon(
                              Icons.email_outlined,
                              color: Colors.green,
                            ),
                            textStyle: const TextStyle(fontSize: 14),
                            hintText: 'Nhập địa chỉ email',
                            // onChanged: (value) => signUpController.email.value = value,
                          ),
                          const SizedBox(height: 5),
                          CustomTextFieldV6(
                            controller: TextEditingController(
                                text: signUpController.password.value),
                            title: 'Mật khẩu',
                            isRequired: false,
                            icon: const Icon(
                              Icons.lock_outline,
                              color: Colors.green,
                            ),
                            textStyle: const TextStyle(fontSize: 14),
                            hintText: 'Nhập mật khẩu',
                            // onChanged: (value) => signUpController.password.value = value,
                          ),
                          const SizedBox(height: 5),
                          CustomTextFieldV6(
                            controller: TextEditingController(
                                text: signUpController.enterPassword.value),
                            title: 'Nhập lại mật khẩu',
                            isRequired: false,
                            icon: const Icon(
                              Icons.lock_outline,
                              color: Colors.green,
                            ),
                            textStyle: const TextStyle(fontSize: 14),
                            hintText: 'Nhập lại mật khẩu',
                            // onChanged: (value) => signUpController.enterPassword.value = value,
                          ),
                          const SizedBox(height: 25),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff538c51),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Đăng ký",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Hoặc đăng nhập với",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 5),
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
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.asset(
                'assets/bottomimage.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}