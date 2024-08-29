import 'package:flutter/material.dart';
import '../../models/MedicineModel.dart';

class MedicineDetails extends StatelessWidget {
  final ThuocTriBenh thuocTriBenh;

  const MedicineDetails({super.key, required this.thuocTriBenh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          thuocTriBenh.tenThuoc,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Giới thiệu:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(thuocTriBenh.thongTin ?? 'No information available'),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/e1e1afe61c77b69bc5d67a8852100e94.png',
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2. Hướng dẫn sử dụng:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(thuocTriBenh.cachSuDung ?? 'No usage information available'),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Divider(thickness: 1, color: Colors.grey),
          _buildSupportFooter(),
        ],
      ),
    );
  }

  Widget _buildSupportFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hãy bỏ vỏ thuốc đúng nơi để cùng chung tay bảo vệ môi trường',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[800],
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Image.asset(
            'assets/a196eb3c8f43db5f22c2de4c258e4953.png',
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

