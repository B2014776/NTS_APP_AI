import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../LoginController/LoginController.dart';
import '../ultils/CustomTextField.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final LoginController login = LoginController();
  bool isCheckLogin = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[ Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
                  color: Color(0xff538c51),
                  height: 300,
                  width: double.infinity,
                  child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        
                      Expanded(flex: 3,child: SvgPicture.asset('assets/iconNTLogo.svg',width: 65,height: 65,)),
                      Spacer(),
                      Expanded(flex: 11,child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Text('Nông nghiệp thông minh', style: TextStyle(fontSize: 25, color: Colors.white),),
                        Text('Nhất Tâm',style: TextStyle(fontSize: 25, color: Colors.white))
                      ],))
                    ],
                  ),
                ),
                Padding(
        
                  padding: const EdgeInsets.fromLTRB(30,190,30,20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,  // Màu nền
                      borderRadius: BorderRadius.circular(10),  // Bo tròn các góc
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),  // Màu của bóng mờ
                          spreadRadius: 5,  // Mức độ lan rộng của bóng mờ
                          blurRadius: 7,  // Độ mờ của bóng mờ
                          offset: Offset(0, 3),  // Vị trí của bóng mờ (x, y)
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    // width: double.infinity,
        
                    child:
        
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),  // Điều chỉnh khoảng cách từ lề trên
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomTextFieldV6(
                          controller: login.username,
                          title: 'Tên tài khoản',
                          isRequired: false,
                          icon: Icon( Icons.account_circle_outlined, color: Colors.green,),
                          textStyle: TextStyle(fontSize: 14),  // Thay đổi cỡ chữ
                          hintText: 'Nhập tên tài khoản',
                          // customIcon: Image.asset('assets/iconAccount.png'),  // Icon từ tệp bên ngoài
                        ),
                        SizedBox(height: 8),
                        CustomTextFieldV6(
                          controller: login.password,
                          title: 'Mật khẩu',
                          isRequired: false,
                          icon: Icon( Icons.lock_outline, color: Colors.green,),
                          textStyle: TextStyle(fontSize: 14),  // Thay đổi cỡ chữ
                          hintText: 'Nhập mật khẩu vào đây',
                          customIcon: Image.asset('assets/iconPassword.png'),  // Icon từ tệp bên ngoài
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




                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Căn giữa các phần tử và giãn đều
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0),  // Đẩy Checkbox và Text ra khỏi mép trái
                                    child: Checkbox(
                                      value: isCheckLogin,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckLogin = value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 0),  // Tạo khoảng cách giữa Checkbox và Text
                                  Expanded(
                                    child: Text(
                                      "Nhớ mật khẩu",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 0.0),  // Đẩy nút TextButton ra khỏi mép phải
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Quên Mật Khẩu ?", style: TextStyle(color: Colors.green, fontSize: 14),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff538c51),  // Màu nền của nút
                            borderRadius: BorderRadius.circular(5),  // Bo tròn các góc với bán kính 5
                          ),
        

                          child: MaterialButton(
                            onPressed: (){},child: Text("Đăng Nhập",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Bạn chưa có tài khoản?", style: TextStyle(fontSize: 14 ),),
                            TextButton(onPressed: (){}, child: Text("Đăng ký",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0xff006400)),)
                            ),
                          ],
                        ),
                        Text("Hoặc đăng nhập với", style: TextStyle(fontSize: 16),),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              padding: EdgeInsets.zero,  // Xóa khoảng cách bên trong nút
                              minWidth: 0,  // Đặt chiều rộng tối thiểu của nút
                              onPressed: () {},
                              child: SvgPicture.asset('assets/ic_facebook_logo.svg'),
                            ),
                            SizedBox(width: 0),  // Đảm bảo không có khoảng cách giữa hai nút
                            MaterialButton(
                              padding: EdgeInsets.zero,  // Xóa khoảng cách bên trong nút
                              minWidth: 0,  // Đặt chiều rộng tối thiểu của nút
                              onPressed: () {},
                              child: SvgPicture.asset('assets/ic_google_logo.svg'),
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
          ]
        ),
      ),
    );
  }
}
