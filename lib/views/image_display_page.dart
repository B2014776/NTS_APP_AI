import 'package:flutter/material.dart';
import 'dart:io';
import 'package:apptestai/controllers/detection/DiseaseDetectionController.dart';
import 'detection/DiseaseDetection.dart';

class ImageDisplayPage extends StatefulWidget {
  final String imagePath;

  const ImageDisplayPage({required this.imagePath, Key? key}) : super(key: key);

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
      final decodedResponse =
          await _diseaseController.uploadImageAndFetchDetails(widget.imagePath);
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
        title: const Text('Ảnh đã chụp', style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.file(
                File(widget.imagePath),
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (_className != null && !_isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Class: $_className',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Probability: ${_probability?.toStringAsFixed(2) ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton.icon(
              onPressed: _uploadImage,
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text('Use Photo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
