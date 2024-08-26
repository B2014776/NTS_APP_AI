import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String imgPath;

  InfoCard({required this.title, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Color.fromARGB(255, 225, 255, 201), // Thay đổi màu nền của Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imgPath,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CropInfoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        InfoCard(
          title: 'Giống cây trồng',
          imgPath: 'assets/giong_cay_trong.png',
        ),
        InfoCard(
          title: 'Kỹ Thuật Trồng',
          imgPath: 'assets/ky_thuat_trong.png',
        ),
        InfoCard(
          title: 'Thời Tiết',
          imgPath: 'assets/thoi_tiet.png',
        ),
        InfoCard(
          title: 'Sâu bệnh hại',
          imgPath: 'assets/sau_benh_hai.png',
        ),
        InfoCard(
          title: 'Thu hoạch',
          imgPath: 'assets/thu_hoach.png',
        ),
        InfoCard(
          title: 'Nhân giống',
          imgPath: 'assets/nhan_giong.png',
        ),
      ],
    );
  }
}
