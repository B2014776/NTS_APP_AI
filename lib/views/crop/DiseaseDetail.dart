import 'package:flutter/material.dart';
import '../../models/DiseaseModel.dart'; // Import the model

class DiseaseDetail extends StatefulWidget {
  final Benh benh;

  DiseaseDetail({required this.benh});

  @override
  _DiseaseDetailState createState() => _DiseaseDetailState();
}

class _DiseaseDetailState extends State<DiseaseDetail> {
  bool _showFullTrieuChung = false;
  bool _showFullNguyenNhan = false;
  bool _showFullDieuKien = false;
  bool _showFullTruBenh = false;
  bool _showFullPhongNgua = false;

  String _truncateText(String text, bool showFull) {
    if (text.length <= 100 || showFull) {
      return text;
    }
    return text.substring(0, 100) + '...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.benh.tenBenh,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back arrow
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/${widget.benh.img}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Image not found'));
                },
              ),
              SizedBox(height: 16),
              // Triệu chứng
              _buildExpandableCard(
                title: 'Triệu chứng',
                content: widget.benh.trieuChung,
                showFull: _showFullTrieuChung,
                onTap: () {
                  setState(() {
                    _showFullTrieuChung = !_showFullTrieuChung;
                  });
                },
              ),
              // Nguyên nhân
              _buildExpandableCard(
                title: 'Nguyên nhân',
                content: widget.benh.nguyenNhan,
                showFull: _showFullNguyenNhan,
                onTap: () {
                  setState(() {
                    _showFullNguyenNhan = !_showFullNguyenNhan;
                  });
                },
              ),
              // Điều kiện
              _buildExpandableCard(
                title: 'Điều kiện',
                content: widget.benh.dieuKien,
                showFull: _showFullDieuKien,
                onTap: () {
                  setState(() {
                    _showFullDieuKien = !_showFullDieuKien;
                  });
                },
              ),
              // Trị bệnh
              _buildExpandableCard(
                title: 'Trị bệnh',
                content: widget.benh.truBenh,
                showFull: _showFullTruBenh,
                onTap: () {
                  setState(() {
                    _showFullTruBenh = !_showFullTruBenh;
                  });
                },
              ),
              // Phòng ngừa
              _buildExpandableCard(
                title: 'Phòng ngừa',
                content: widget.benh.phongNgua,
                showFull: _showFullPhongNgua,
                onTap: () {
                  setState(() {
                    _showFullPhongNgua = !_showFullPhongNgua;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableCard({
    required String title,
    required String content,
    required bool showFull,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Color.fromARGB(255, 225, 255, 201),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _truncateText(content, showFull),
              style: TextStyle(fontSize: 16),
            ),
            if (content.length > 100)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onTap,
                  child: Text(
                    showFull ? 'Thu gọn' : 'Xem thêm',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

  }
}
