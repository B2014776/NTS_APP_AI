import 'package:flutter/material.dart';
import '../../../controllers/crop/CropController.dart';

class CropAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CropController controller;
  final double appBarHeight;

  const CropAppBar({required this.controller, this.appBarHeight = 80.0});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          controller.loaiCayTrong?.tenLoai ?? 'Loading...',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Center(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
