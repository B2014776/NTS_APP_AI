import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert'; // Import for json decoding
import 'package:http/http.dart' as http; // Import for HTTP requests

class ImageDisplayPage extends StatefulWidget {
  final String imagePath;

  const ImageDisplayPage({required this.imagePath});

  @override
  _ImageDisplayPageState createState() => _ImageDisplayPageState();
}

class _ImageDisplayPageState extends State<ImageDisplayPage> {
  String? _className;
  double? _probability;
  bool _isLoading = false;



  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api-ai-1-6b81.onrender.com/predict'), // Replace with your FastAPI endpoint
    );

    // Thêm tệp vào yêu cầu
    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // Tên tham số phải khớp với endpoint FastAPI của bạn
        widget.imagePath,
      ),
    );

    // Tạo thông tin xác thực Basic Authentication
    String username = 'admin';
    String password = 'laptrinh';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    // Thêm tiêu đề xác thực vào yêu cầu
    request.headers['Authorization'] = basicAuth;

    try {
      // Gửi yêu cầu
      final response = await request.send();

      // Kiểm tra phản hồi từ server
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final decodedResponse = json.decode(responseBody);

        setState(() {
          _className = decodedResponse['class_name']; // Kết quả lớp dự đoán
          _probability = decodedResponse['probability']; // Xác suất dự đoán
        });
      } else {
        setState(() {
          _className = 'Upload failed';
          _probability = null;
        });
      }
    } catch (e) {
      setState(() {
        _className = 'Error occurred';
        _probability = null;
      });
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false; // Set loading state to false
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ảnh đã chụp', style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.file(
                File(widget.imagePath),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
          if (_className != null && !_isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Class: $_className\nProbability: ${_probability?.toStringAsFixed(2) ?? 'N/A'}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.check_circle_outline, color: Colors.green),
                  onPressed: _uploadImage,
                  iconSize: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
