import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../views/Agri_expert/List_views.dart';
import '../views/Community.dart';
import '../views/camera.dart';
import '../views/home.dart';

class TestCustomBottomNavigationBar extends StatefulWidget {
  final CameraDescription camera;
  final int currentIndex;
  final Function(int) onTap;

  const TestCustomBottomNavigationBar({
    required this.camera,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _TestCustomBottomNavigationBarState createState() => _TestCustomBottomNavigationBarState();
}

class _TestCustomBottomNavigationBarState extends State<TestCustomBottomNavigationBar> {
  List<IconData> _iconList = [
    Icons.home,
    Icons.public,
    Icons.qr_code_scanner,
    Icons.headset_mic,
    Icons.person,
  ];

  void _handleNavigation(int index) {
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraScreen(camera: widget.camera),
        ),
      );
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
          builder: (context) => AgriExpert(),
        ),
      );
    }
    widget.onTap(index); // Gọi hàm onTap nếu bạn có xử lý thêm ngoài điều hướng
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _iconList.map((icon) {
              int index = _iconList.indexOf(icon);
              return IconButton(
                icon: index == 2
                    ? Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                )
                    : Icon(
                  icon,
                  color: widget.currentIndex == index ? Colors.green : Colors.grey,
                ),
                onPressed: () => _handleNavigation(index),
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 20,
          left: (MediaQuery.of(context).size.width / _iconList.length) * widget.currentIndex +
              (MediaQuery.of(context).size.width / _iconList.length - 60) / 2,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _iconList[widget.currentIndex],
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
