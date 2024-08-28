import 'package:flutter/material.dart';

class CropCard extends StatefulWidget {
  @override
  _CropCardState createState() => _CropCardState();
}

class _CropCardState extends State<CropCard> {
  String description = 'Cách trồng: Gieo hạt, tưới nước,...'; // Biến trạng thái

  // void updateDescription() {
  //   setState(() {
  //     description = 'Mô tả mới về cách trồng cây...'; // Cập nhật trạng thái
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Nền màu trắng cho container
        borderRadius: BorderRadius.circular(5), // Bo góc Container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
            spreadRadius: 2, // Bán kính lan rộng của bóng
            blurRadius: 5, // Độ mờ của bóng
            offset: Offset(0, 3), // Vị trí của bóng
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/cachua.png'),
            SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cà chua',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text('Loại cây: cây ăn quả'),
                Text(description), // Sử dụng biến trạng thái
                // ElevatedButton(
                //   onPressed: updateDescription, // Nút để cập nhật trạng thái
                //   child: Text('Cập nhật mô tả'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
