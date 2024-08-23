import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'image_display_page.dart';  // Import trang hiển thị hình ảnh

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFlash() async {
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
    await _controller.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
  }

  Future<void> _capturePicture() async {
    try {
      await _initializeControllerFuture;

      // Capture the picture and get the file path
      final XFile picture = await _controller.takePicture();

      // Save the captured picture to the gallery
      // await GallerySaver.saveImage(picture.path);

      // Update the image path to show the captured image
      setState(() {
        _imagePath = picture.path;
      });

      // Navigate to the ImageDisplayPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayPage(imagePath: picture.path),
        ),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to capture picture: $e')),
      );
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });

      // Navigate to the ImageDisplayPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayPage(imagePath: pickedFile.path),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [

                  FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    icon: Icon(Icons.help_outline, color: Colors.white),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Help'),
                            content: Text('This is a help dialog.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.image, color: Colors.white),
                  onPressed: _pickImageFromGallery,
                    iconSize: 40
                ),
                IconButton(
                  icon: Icon(Icons.camera, color: Colors.white),
                  iconSize: 60,
                  onPressed: _capturePicture,
                ),
                IconButton(
                  icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white),
                  iconSize: 40,
                  onPressed: _toggleFlash,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
