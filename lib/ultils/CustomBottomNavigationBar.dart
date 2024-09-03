import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../views/Agri_expert/List_views.dart';
import '../views/Community.dart';
import '../views/home/CustomBottomSheet.dart';
import '../views/home/home.dart';
import '../views/image_display_page.dart';
import '../views/profile/Account.dart';
import 'package:camera/camera.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final CameraDescription camera;
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    super.key,
    required this.camera,
    required this.currentIndex,
    required this.onTap,
  });


  Future<void> _openCameraOptions(BuildContext context) async {
    final XFile? image = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return const Custombottomsheet();
      },
    );

    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayPage(imagePath: image.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) async {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Community(),
            ),
          );
        } else if (index == 2) {
          await _openCameraOptions(
              context); // Hiển thị BottomSheet thay vì hộp thoại
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgriExpert(),
            ),
          );
        } else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Account(),
            ),
          );
        }
        onTap(index);
      },
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Cộng đồng',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green, // Màu nền cho nút camera
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 30, // Tăng kích thước biểu tượng
            ),
          ),
          label: '', // Nhãn trống cho biểu tượng trung tâm
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.headset_mic),
          label: 'Chuyên gia',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Tài khoản',
        ),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }
}
