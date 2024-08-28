import 'package:apptestai/views/profile/Account.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../views/Agri_expert/List_views.dart';
import '../views/Community.dart';
import '../views/camera.dart';
import '../views/home.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final CameraDescription camera;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({required this.camera, required this.currentIndex, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        // Xử lý điều hướng theo index
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(), // Chuyển đến trang HomePage
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Community(), // Chuyển đến trang Community
            ),
          );
        } else if (index==2){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(camera: camera,),
              ),
            );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgriExpert(), // Chuyển đến trang Community
            ),
          );
        } else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Account(), // Chuyển đến trang Community
            ),
          );
        }
        // Thêm điều kiện cho các index khác nếu cần
        onTap(index); // Gọi hàm onTap nếu bạn có xử lý thêm ngoài điều hướng
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Cộng đồng',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green, // Màu xanh đậm của nút trung tâm
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          ),
          label: '', // Nút giữa không có nhãn
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.headset_mic),
          label: 'Chuyên gia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Tài khoản',
        ),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }
}
