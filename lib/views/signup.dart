import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../LoginController/LoginController.dart';
import '../ultils/CustomTextField.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _loginState();
}

class _loginState extends State<Signup> {
  final LoginController login = LoginController();
  var test;
  bool isCheckLogin = false;
  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
                      color: Color(0xff538c51),
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
                          color: Colors.white, // Màu nền
                          borderRadius:
                          BorderRadius.circular(10), // Bo tròn các góc
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Màu của bóng mờ
                              spreadRadius: 5, // Mức độ lan rộng của bóng mờ
                              blurRadius: 7, // Độ mờ của bóng mờ
                              offset: Offset(0, 3), // Vị trí của bóng mờ (x, y)
                            ),
                          ],
                        ),
                        // color: Colors.white,
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        // width: double.infinity,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 0,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 6), // Điều chỉnh khoảng cách từ lề trên
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 6),
                            CustomTextFieldV6(
                              controller: login.username,
                              title: 'Tài khoản',
                              isRequired: false,
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.green,
                              ),
                              textStyle:
                              TextStyle(fontSize: 14), // Thay đổi cỡ chữ
                              hintText: 'Nhập tên tài khoản',

                            ),
                            SizedBox(height: 5),
                            CustomTextFieldV6(
                              controller: login.phone,
                              title: 'Số điện thoại',
                              isRequired: false,
                              icon: Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                              textStyle:
                              TextStyle(fontSize: 14), // Thay đổi cỡ chữ
                              hintText: 'Nhập số điện thoại',
                              // Icon từ tệp bên ngoài
                            ),
                            SizedBox(height: 5),
                            CustomTextFieldV6(
                              controller: login.email,
                              title: 'Email',
                              isRequired: false,
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.green,
                              ),
                              textStyle:
                              TextStyle(fontSize: 14), // Thay đổi cỡ chữ
                              hintText: 'Nhập địa chỉ email',
                              // Icon từ tệp bên ngoài
                            ),
                            SizedBox(height: 5),
                            CustomTextFieldV6(
                              controller: login.password,
                              title: 'Mật khẩu',
                              isRequired: false,
                              icon: Icon(
                                Icons.lock_outline,
                                color: Colors.green,
                              ),
                              textStyle:
                              TextStyle(fontSize: 14), // Thay đổi cỡ chữ
                              hintText: 'Nhập mật khẩu',
                              // Icon từ tệp bên ngoài
                            ),
                            SizedBox(height: 5),
                            CustomTextFieldV6(
                              controller: login.enterpassword,
                              title: 'Nhập lại mật khẩu',
                              isRequired: false,
                              icon: Icon(
                                Icons.lock_outline,
                                color: Colors.green,
                              ),
                              textStyle:
                              TextStyle(fontSize: 14), // Thay đổi cỡ chữ
                              hintText: 'Nhập lại mật khẩu',
                              // Icon từ tệp bên ngoài
                            ),
                            //
                            // TextField(
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(),
                            //       labelText: "Nhập tên tài khoản",
                            //       prefixIcon: Icon(Icons.supervised_user_circle_rounded)
                            //     // suffixIcon: Icon(Icons.supervised_user_circle)
                            //   ),
                            // ),

                            SizedBox(height: 25,),
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff538c51), // Màu nền của nút
                                borderRadius: BorderRadius.circular(
                                    5), // Bo tròn các góc với bán kính 5
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            SizedBox(height: 8,),
                            Text(
                              "Hoặc đăng nhập với",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  padding: EdgeInsets
                                      .zero, // Xóa khoảng cách bên trong nút
                                  minWidth:
                                  0, // Đặt chiều rộng tối thiểu của nút
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      'assets/ic_facebook_logo.svg'),
                                ),
                                SizedBox(
                                    width:
                                    0), // Đảm bảo không có khoảng cách giữa hai nút
                                MaterialButton(
                                  padding: EdgeInsets
                                      .zero, // Xóa khoảng cách bên trong nút
                                  minWidth:
                                  0, // Đặt chiều rộng tối thiểu của nút
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

              // form dăng nhập

              Container(
                width: MediaQuery.of(context).size.width * 1,  // Chiếm 50% chiều rộng của màn hình
                height: 200,  // Bạn có thể đặt chiều cao cố định
                child: Image.asset(
                  'assets/bottomimage.png',
                  fit: BoxFit.cover,  // Vẫn bao phủ toàn bộ ô cha nhưng không làm bự quá
                ),
              ),


            ]),
      ),
    );
  }
}
