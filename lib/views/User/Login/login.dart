import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/SignInController.dart';
import '../../../helper/ToastHelper.dart';
import '../../home/home.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  void initState() {
    super.initState();
    ToastHelper.init(context);
  }

  bool isChecked = false;
  TextEditingController email =
      TextEditingController(text: 'batungx271@gmail.com');
  TextEditingController password = TextEditingController(text: '12345678');
  final authController = Get.put(SignInController());
  final storage = const FlutterSecureStorage();

  Future<void> login() async {
    authController.isLoginLoading.value = true;
    Map<String, dynamic> result =
        await authController.loginUser(email.text, password.text);
    if (result.isNotEmpty && result['error'] == null) {
      ToastHelper.showSuccessToast('Đăng nhập thành công!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      if (isChecked) {
        // Save email and password if "Remember Me" is checked
        await storage.write(key: 'email', value: email.text);
        await storage.write(key: 'password', value: password.text);
      }
    } else {
      // Show error message if login fails
      ToastHelper.showErrorToast(
          'Login failed: ${authController.loginErrorMessage.value}');
    }
    authController.isLoginLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: email,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            controller: password,
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Remember Me",
                                style: TextStyle(color: Colors.black),
                              ),
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                          Obx(() {
                            return authController.isLoginLoading.value
                                ? const CircularProgressIndicator() // Show loading indicator when logging in
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor:
                                            const Color(0xff4c505b),
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            login(); // Call login method
                                          },
                                          icon: const Icon(Icons.arrow_forward),
                                        ),
                                      ),
                                    ],
                                  );
                          }),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Show error message for forgot password feature
                                  ToastHelper.showErrorToast(
                                      'Forgot Password feature not implemented');
                                },
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
