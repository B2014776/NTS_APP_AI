import 'package:flutter/material.dart';

class SupportFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.white, // Thay đổi nền để phân biệt
      child: Column(
        mainAxisSize: MainAxisSize.min, // Đảm bảo Column chỉ chiếm không gian cần thiết
        crossAxisAlignment: CrossAxisAlignment.stretch, // Căn chỉnh các phần tử theo chiều ngang
        children: [
          Center(
            child: Text(
              'Bạn cần hỗ trợ thêm',
              style: TextStyle(
                fontSize: 16, // Giảm kích thước chữ
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
          ),
          SizedBox(height: 8), // Giảm khoảng cách giữa các phần tử
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Căn giữa các nút
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                icon: Icon(Icons.chat, color: Colors.white),
                label: Text('Chatbot', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                icon: Icon(Icons.phone, color: Colors.white),
                label: Text('Liên hệ chuyên gia', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
