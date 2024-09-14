import 'package:apptestai/views/profile/widgets/AccountInforCard2.dart';
import 'package:apptestai/views/profile/widgets/function.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:apptestai/controllers/profile/AccountController.dart';
import 'package:apptestai/views/profile/widgets/AccountInfoCard.dart';
import '../../ultils/CustomBottomNavigationBar.dart';
import '../../../models/UserModel.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final UserController _controller = UserController();
  bool _isLoading = true;
  User? _user;

  final CameraDescription camera = CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchUserFromAPI().then((_) {
      setState(() {
        _user = _controller.user;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            height: 250, // Chiều cao cố định cho Stack
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 176,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/fdbba029e959749c39816f3b6c7b42f5.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 8,  // Căn chỉnh trái sát màn hình
                  right: 8, // Căn chỉnh phải sát màn hình
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _user != null
                      ? AccountInfoCard2(user: _user!)
                      : Center(child: Text('No user data')),
                ),
              ],
            ),
          ),
          SizedBox(height: 95,), // Khoảng cách phía trên của ListView
          Expanded(
            child: Container(
              color: Colors.white, // Thay đổi màu nền của Container bao quanh ListView
              child: ListView(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0), // Padding cho ListView
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của Container
                      borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 10
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Màu bóng với độ mờ
                          spreadRadius: 5, // Độ lan rộng của bóng
                          blurRadius: 7,   // Độ mờ của bóng
                          offset: Offset(0, 3), // Vị trí bóng (x, y)
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cài đặt ứng dụng', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0), // Padding xung quanh CustomMenuItem
                          child: Column(
                            children: [
                              CustomMenuItem(
                                icon: Icons.color_lens_outlined,
                                functionName: 'Tùy chỉnh giao diện',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                              CustomMenuItem(
                                icon: Icons.face_unlock_rounded,
                                functionName: 'Đăng nhập bằng FaceID',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của Container
                      borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 10
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Màu bóng với độ mờ
                          spreadRadius: 5, // Độ lan rộng của bóng
                          blurRadius: 7,   // Độ mờ của bóng
                          offset: Offset(0, 3), // Vị trí bóng (x, y)
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Điều khoản và hỗ trợ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0), // Padding xung quanh CustomMenuItem
                          child: Column(
                            children: [
                              CustomMenuItem(
                                icon: Icons.menu_book,
                                functionName: 'Thông tin nhà phát triển',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                              CustomMenuItem(
                                icon: Icons.list_alt_outlined,
                                functionName: 'Điều khoản sử dụng',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                              CustomMenuItem(
                                icon: Icons.phone_android,
                                functionName: 'Thông tin ứng dụng',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                              CustomMenuItem(
                                icon: Icons.chat_outlined,
                                functionName: 'Liên hệ với chúng tôi',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của Container
                      borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 10
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Màu bóng với độ mờ
                          spreadRadius: 5, // Độ lan rộng của bóng
                          blurRadius: 7,   // Độ mờ của bóng
                          offset: Offset(0, 3), // Vị trí bóng (x, y)
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Các chức năng khác', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0), // Padding xung quanh CustomMenuItem
                          child: Column(
                            children: [
                              CustomMenuItem(
                                icon: Icons.post_add,
                                functionName: 'Lịch sử bài viết',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                              CustomMenuItem(
                                icon: Icons.chat_outlined,
                                functionName: 'Lịch sử trò chuyện ',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                              CustomMenuItem(
                                icon: Icons.logout_outlined,
                                functionName: 'Đăng xuất',
                                nextIcon: Icons.arrow_forward_ios,
                                onTap: () {
                                  // Handle tap action
                                },
                              ),
                            ],
                          ),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
          // Xử lý điều hướng cho BottomNavigationBar
        },
        camera: camera,
      ),
    );
  }
}
