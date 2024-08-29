import 'package:apptestai/controllers/detection/DiseaseDetectionController.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert'; // Import for json decoding
import 'package:http/http.dart' as http;

import 'detection/DiseaseDetection.dart'; // Import for HTTP requests

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

    print('Uploading image from path: ${widget.imagePath}');
    DiseaseController controller = DiseaseController();
    controller.fetchBenhFromAPI();

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api-ai-1-6b81.onrender.com/predict/'), // Replace with your FastAPI endpoint
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // This should match the parameter name in your FastAPI endpoint
        widget.imagePath,
      ),
    );

    try {
      final response = await request.send();
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');

        final decodedResponse = json.decode(responseBody);
        print('Decoded response: $decodedResponse');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiseaseDetection(),
          ),
        );

        setState(() {
          _className = decodedResponse['class_name'];
          _probability = decodedResponse['probability'];
        });
      } else {
        print('Upload failed with status code: ${response.statusCode}');
        setState(() {
          _className = 'Upload failed';
          _probability = null;
        });
      }
    } catch (e) {
      print('An error occurred: $e');
      setState(() {
        _className = 'An error occurred';
        _probability = null;
      });
    } finally {
      setState(() {
        _isLoading = false; // Set loading state to false
      });
      print('Upload process completed');
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
