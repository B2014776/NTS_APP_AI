import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
            BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/avatar.png',
                            fit: BoxFit.cover, // Đảm bảo ảnh được phủ toàn bộ container
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Text('Nguyễn Văn A', style: TextStyle(fontSize: 16),),
                    ],
                  ),

                ],
              ),
          ),
          ListTile(
            leading: Icon(Icons.menu_book_outlined, color: Colors.green,),
            title: Text('Giới thiệu NTAgri'),
            onTap: () {
              // Xử lý khi nhấn vào Home
              Navigator.pop(context); // Đóng Drawer sau khi chọn
            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.green,),
            title: Text('Chia sẻ ứng dụng'),
            onTap: () {
              // Xử lý khi nhấn vào Settings
              Navigator.pop(context); // Đóng Drawer sau khi chọn
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_outlined, color: Colors.green,),
            title: Text('Câu hỏi thường gặp'),
            onTap: () {
              // Xử lý khi nhấn vào Settings
              Navigator.pop(context); // Đóng Drawer sau khi chọn
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card_sharp, color: Colors.green,),
            title: Text('Điều khoản sử dụng'),
            onTap: () {
              // Xử lý khi nhấn vào Settings
              Navigator.pop(context); // Đóng Drawer sau khi chọn
            },
          ),
          ListTile(
            leading: Icon(Icons.text_snippet_outlined, color: Colors.green,),
            title: Text('Góp ý cho chúng tôi'),
            onTap: () {
              // Xử lý khi nhấn vào Settings
              Navigator.pop(context); // Đóng Drawer sau khi chọn
            },
          ),
        ],
      ),
    );
  }
}
