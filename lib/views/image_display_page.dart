import 'package:apptestai/controllers/detection/DiseaseDetectionController.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'detection/DiseaseDetection.dart';

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
  final DiseaseController _diseaseController = DiseaseController();

  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final decodedResponse = await _diseaseController.uploadImageAndFetchDetails(widget.imagePath);
      print("decodedResponse : $decodedResponse");
      if (decodedResponse.containsKey('error')) {
        setState(() {
          _className = decodedResponse['error'];
          _probability = null;
        });
      } else {
        setState(() {
          _className = decodedResponse['class_name'];
          _probability = decodedResponse['probability'];
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiseaseDetection(response: decodedResponse),
          ),
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      setState(() {
        _className = 'An error occurred';
        _probability = null;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ảnh đã chụp', style: TextStyle(fontSize: 25)),
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
