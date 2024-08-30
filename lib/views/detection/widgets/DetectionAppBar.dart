import 'package:flutter/material.dart';

class DetectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String diseaseName; // Thêm biến để nhận tên bệnh

  const DetectionAppBar({
    Key? key,
    required this.diseaseName, // Nhận tên bệnh từ response
    this.appBarHeight = 80.0,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          diseaseName.isNotEmpty ? diseaseName : 'Loading...', // Hiển thị tên bệnh từ response
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Center(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/d7ba6024f3f77dd57e3abe35fc9d8185.png'),
            ),
          ),
        ],
      ),
    );
  }
}
