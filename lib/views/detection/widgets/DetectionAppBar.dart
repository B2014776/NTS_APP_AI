import 'package:flutter/material.dart';
import '../../../controllers/DiseaseDetectionController.dart';

class DetectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DiseaseController controller;
  const DetectionAppBar({required this.controller});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight); // Cập nhật chiều cao

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(controller.benh?.tenBenh ?? 'Loading...'),
      leading: Center(
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/f25dabbda140c250232a6b1a711d952c.png'),
          ),
        ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(text: 'Thông tin chung'),
          Tab(text: 'Cách điều trị'),
          Tab(text: 'Cách phòng ngừa'),
        ],
      ),
    );
  }
}
