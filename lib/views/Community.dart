import 'package:apptestai/views/Post.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../ultils/CustomBottomNavigationBar.dart';
import 'camera.dart'; // Giả sử CameraScreen cần sử dụng CameraDescription từ đây

class Community extends StatefulWidget {
  final String avatarUrl = 'https://congthuong-cdn.mastercms.vn/stores/news_dataimages/2023/082023/02/11/in_article/hoang-trong-thuy20230802114258.jpg?rt=20230802114259';
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  // Biến trạng thái có thể khai báo ở đây
  int _currentIndex = 1; // Giả sử Community là chỉ mục 1

  // Dummy CameraDescription để truyền vào CustomBottomNavigationBar
  final CameraDescription camera = CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );

  void _onTap(int index) {
    // Thực hiện các hành động khi một mục được nhấn
    // Ví dụ: cập nhật chỉ mục hiện tại
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Cộng đồng',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(widget.avatarUrl),
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 20),
                    Expanded( // Dùng Expanded để ngăn lỗi RenderFlex vô hạn
                      child: Text(
                        'Bạn đang nghĩ gì?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Icon(
                      Icons.broken_image_outlined,
                      size: 30,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Post(),
              Post(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        camera: camera,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
