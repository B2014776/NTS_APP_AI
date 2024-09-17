import 'package:flutter/material.dart';

class ExpertCard extends StatefulWidget {
  @override
  _ExpertCardState createState() => _ExpertCardState();
}

class _ExpertCardState extends State<ExpertCard> {
  String ExperName ='Hoàng Trọng Thủy';
  String Categories = 'Cây ăn qua';
  final String imageUrl = 'https://congthuong-cdn.mastercms.vn/stores/news_dataimages/2023/082023/02/11/in_article/hoang-trong-thuy20230802114258.jpg?rt=20230802114259';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      decoration: BoxDecoration(
        color: Colors.white, // Nền màu trắng cho container
        borderRadius: BorderRadius.circular(5), // Bo góc Container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Màu đổ bóng với độ mờ
            spreadRadius: 1, // Bán kính lan rộng của bóng
            blurRadius: 3, // Độ mờ của bóng
            offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Image.network(
                  imageUrl, // Sử dụng biến chứa URL hình ảnh
                  width: 86,
                  height: 104,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              ),
              SizedBox(width: 10, height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Chuyên gia ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    ExperName,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/Treeicon.png', width: 50, height: 50,),
                      SizedBox(width: 10),
                      Text(
                        Categories,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 335,
            height: 68,
            color: Color(0xffCFEBF7),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 30),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    icon: Icon(Icons.chat, color: Colors.black),
                    label: Text('Nhắn tin', style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 30),
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    icon: Icon(Icons.phone, color: Colors.black),
                    label: Text('Gọi điện', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
