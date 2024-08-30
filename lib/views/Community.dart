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
  int _currentIndex = 1; // Giả sử Community là chỉ mục 1

  final CameraDescription camera = const CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Cộng đồng',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 4.0, // Thêm hiệu ứng bóng cho AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Post(),
                    Post(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        camera: camera,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(widget.avatarUrl),
          backgroundColor: Colors.grey[200],
        ),
        const SizedBox(width: 15),
        const Expanded(
          child: Text(
            'Bạn đang nghĩ gì?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.image_outlined, size: 30, color: Colors.green),
          onPressed: () {
            // Xử lý sự kiện khi nhấn vào icon
          },
        ),
      ],
    );
  }
}
