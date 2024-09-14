import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/EditAccountController.dart';
 // Đảm bảo đường dẫn chính xác

class GenderPicker extends StatefulWidget {
  final EditAccountController controller;

  GenderPicker({required this.controller});

  @override
  _GenderPickerState createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Row(
        children: [
          Icon(Icons.transgender_outlined, color: Colors.green, size: 20),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              widget.controller.gender.value.isEmpty
                  ? 'Chọn giới tính'
                  : widget.controller.gender.value,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down, color: Colors.green, size: 30),
            onSelected: (String value) {
              setState(() {
                widget.controller.gender.value = value;
                widget.controller.validateForm();
              });
            },

            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Nam',
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Nam', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Nữ',
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Nữ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
