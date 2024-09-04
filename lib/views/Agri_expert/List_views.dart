import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ultils/CustomBottomNavigationBar.dart';
import '../../ultils/CustomTextField.dart';
import '../../ultils/ExpertCard.dart';

class AgriExpert extends StatelessWidget {
  late TextEditingController search_expert = TextEditingController();

  final CameraDescription camera = CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Chuyên gia nông nghiệp",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomTextFieldV3(
                    labelText: 'Tìm kiếm',
                    hintText: 'Tìm kiếm',
                    prefixIcon: CupertinoIcons.search,
                    validatorValue: '',
                    controller: search_expert,
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(height: 20),
              ExpertCard(),
              SizedBox(height: 20),
              ExpertCard(),
              SizedBox(height: 20),
              ExpertCard(),
              SizedBox(height: 20),
              ExpertCard(),
              SizedBox(height: 20),
              ExpertCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {
          // Xử lý điều hướng cho BottomNavigationBar
        },
        camera: camera,
      ),
    );
  }
}
