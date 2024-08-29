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
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                color: Colors.green,
              ),
              Positioned(
                top: 100,
                left: 16,
                right: 16,
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _user != null
                        ? AccountInfoCard(user: _user!)
                        : Center(child: Text('No user data')),
              ),
            ],
          ),
          SizedBox(height: 150),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.redAccent,
                  ),
                  title: Text('Lịch sử cuộc gọi'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {

                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.green,
                  ),
                  title: Text('Lịch sử tin nhắn'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {

                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.article,
                    color: Colors.blue,
                  ),
                  title: Text('Lịch sử bài viết'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {

                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Quản lý tài khoản',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Đổi mật khẩu'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {

                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Đăng xuất'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {

                  },
                ),
              ],
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
