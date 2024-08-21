import 'package:flutter/material.dart';
import '../LoginController/DiseaseDetectionController.dart';

class diseaseDetection extends StatefulWidget {


  const diseaseDetection({super.key});

  @override
  State<diseaseDetection> createState() => _diseaseDetectionState();
}

class _diseaseDetectionState extends State<diseaseDetection> {
  final DiseasedetectionController controller = DiseasedetectionController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.controller.benh.tenBenh),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/benh_image.png'),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Thông tin chung'),
              Tab(text: 'Cách điều trị'),
              Tab(text: 'Cách phòng ngừa'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/nhandien1.png',
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '1. Triệu chứng:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(widget.controller.benh.trieuChung),
                          SizedBox(height: 16),
                          Text(
                            '2. Nguyên nhân:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(widget.controller.benh.nguyenNhan),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Bạn cần hỗ trợ thêm?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        icon: Icon(Icons.chat, color: Colors.white),
                        label: Text(
                          'Chatbot',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        icon: Icon(Icons.phone, color: Colors.white),
                        label: Text(
                          'Liên hệ chuyên gia',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(child: Text(widget.controller.benh.dieuKien)),
            Center(child: Text(widget.controller.benh.truBenh)),
            Center(child: Text(widget.controller.benh.phongNgua)),
          ],
        ),
      ),
    );
  }
}
