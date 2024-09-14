import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AvatarWidget extends StatefulWidget {
  final RxString avatarUrl;
  final VoidCallback? onTap; // Thêm tham số này

  AvatarWidget({required this.avatarUrl, this.onTap});

  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap, // Thực hiện onTap khi nhấn vào avatar
        child: Stack(
          children: [
            Obx(() {
              return CircleAvatar(
                  radius: 35,
                  backgroundImage: widget.avatarUrl.value.isNotEmpty
                      ? FileImage(File(widget.avatarUrl.value))
                      : const AssetImage('assets/avatar.jpg') as ImageProvider,
                  child: null);
            }),
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                icon:
                    const Icon(Icons.camera_alt, color: Colors.grey, size: 20),
                onPressed: () {
                  _pickImage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Chụp ảnh từ camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    widget.avatarUrl.value = image.path;
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Chọn từ thư viện'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    widget.avatarUrl.value = image.path;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
