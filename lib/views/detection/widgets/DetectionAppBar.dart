import 'package:flutter/material.dart';
import '../../../controllers/detection/DiseaseDetectionController.dart';

class DetectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DiseaseController controller;
  final double appBarHeight;

  const DetectionAppBar({required this.controller, this.appBarHeight = 80.0});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          controller.benh?.tenBenh ?? 'Loading...',
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/d7ba6024f3f77dd57e3abe35fc9d8185.png'),
            ),
          ),
        ],
      ),
    );
  }
}
