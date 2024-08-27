import 'package:flutter/material.dart';
import '../../../controllers/crop/CropController.dart';

class DiseaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;

  const DiseaseAppBar({ this.appBarHeight = 65.0});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Các loài sâu bệnh',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
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
