import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Custombottomsheet extends StatefulWidget {
  const Custombottomsheet({super.key});

  @override
  State<Custombottomsheet> createState() => _CustombottomsheetState();
}

final ImagePicker _picker = ImagePicker();

class _CustombottomsheetState extends State<Custombottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.green),
            title: const Text('Chụp ảnh'),
            onTap: () async {
              Navigator.pop(
                  context, await _picker.pickImage(source: ImageSource.camera));
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Colors.blue),
            title: const Text('Chọn từ thư viện'),
            onTap: () async {
              Navigator.pop(context,
                  await _picker.pickImage(source: ImageSource.gallery));
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel, color: Colors.red),
            title: const Text('Hủy'),
            onTap: () {
              Navigator.pop(context, null);
            },
          ),
        ],
      ),
    );
    ;
  }
}
