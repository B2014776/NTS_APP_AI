import 'package:flutter/material.dart';

import 'Crop_card2.dart';
import 'SupportFooter.dart';
import 'crop_card.dart';

class NoDisease extends StatefulWidget {
  @override
  _NoDiseaseState createState() => _NoDiseaseState();
}

class _NoDiseaseState extends State<NoDisease> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  String text = 'Cây lúa (Oryza sativa) là một loại cây trồng quan trọng, chủ yếu ở các nước châu Á. Đây là nguồn lương thực chính cho hàng tỷ người trên toàn cầu. Cây lúa thuộc họ hòa thảo, được trồng trong điều kiện đất ngập nước, nơi có khí hậu nhiệt đới và cận nhiệt đới. Quá trình sinh trưởng của cây lúa bao gồm các giai đoạn từ gieo hạt, sinh trưởng, trổ bông đến thu hoạch. Cây lúa (Oryza sativa) là một loại cây trồng quan trọng, chủ yếu ở các nước châu Á. Đây là nguồn lương thực chính cho hàng tỷ người trên toàn cầu. Cây lúa thuộc họ hòa thảo, được trồng trong điều kiện đất ngập nước, nơi có khí hậu nhiệt đới và cận nhiệt đới. .';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Nền màu xanh lá
        title: Text(
          "Cây không có bệnh",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true, // Căn giữa tiêu đề
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar_rice.png'), // Đường dẫn hình ảnh avatar
              radius: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/Lua2.png', width: double.infinity),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 170, 40, 30),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white, // Nền màu trắng cho container
                      borderRadius: BorderRadius.circular(5), // Bo góc Container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3), // Màu đổ bóng với độ mờ
                          spreadRadius: 1, // Bán kính lan rộng của bóng
                          blurRadius: 3, // Độ mờ của bóng
                          offset: Offset(0, 3), // Vị trí của bóng
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Cây lúa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Expanded(child: Text(text, style: TextStyle(fontSize: 18),)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GreenCropCard(),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 100,
         // Chiều cao của SupportFooter
        child: SupportFooter(),
      ),

    );
  }
}
